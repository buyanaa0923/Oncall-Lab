import 'dart:async';
import 'package:flutter/foundation.dart';
import '../models/request_model.dart';
import '../services/admin_service.dart';
import '../services/supabase_service.dart';

class RequestsProvider with ChangeNotifier {
  final AdminService _adminService = AdminService();

  List<RequestModel> _requests = [];
  bool _isLoading = false;
  String? _errorMessage;
  StreamSubscription? _requestsSubscription;

  List<RequestModel> get requests => _requests;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  /// Subscribe to real-time request updates
  void subscribeToRequests() {
    // Cancel existing subscription
    _requestsSubscription?.cancel();

    // Initial load
    loadRequests();

    // Subscribe to test_requests table changes
    _requestsSubscription = supabase
        .from('test_requests')
        .stream(primaryKey: ['id'])
        .order('created_at', ascending: false)
        .listen((data) {
          _handleRequestsUpdate(data);
        }, onError: (error) {
          _errorMessage = error.toString();
          notifyListeners();
        });
  }

  void _handleRequestsUpdate(List<Map<String, dynamic>> data) async {
    // Reload full request data to get joined information (patient name, doctor name, service name)
    await loadRequests();
  }

  Future<void> loadRequests() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _requests = await _adminService.getAllRequests();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> updateRequestStatus(String requestId, String newStatus) async {
    try {
      await _adminService.updateRequestStatus(requestId, newStatus);
      await loadRequests(); // Reload data
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<void> refresh() async {
    await loadRequests();
  }

  /// Unsubscribe from real-time updates
  void unsubscribe() {
    _requestsSubscription?.cancel();
  }

  @override
  void dispose() {
    unsubscribe();
    super.dispose();
  }
}
