import 'dart:async';
import 'package:flutter/foundation.dart';
import '../models/dashboard_stats.dart';
import '../services/admin_service.dart';
import '../services/supabase_service.dart';

class DashboardProvider with ChangeNotifier {
  final AdminService _adminService = AdminService();

  DashboardStats? _stats;
  List<DailyRequestStat> _dailyStats = [];
  bool _isLoading = false;
  String? _errorMessage;
  StreamSubscription? _requestsSubscription;
  StreamSubscription? _profilesSubscription;

  DashboardStats? get stats => _stats;
  List<DailyRequestStat> get dailyStats => _dailyStats;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  /// Subscribe to real-time dashboard updates
  void subscribeToDashboard() {
    // Cancel existing subscriptions
    _requestsSubscription?.cancel();
    _profilesSubscription?.cancel();

    // Initial load
    loadDashboardData();

    // Subscribe to test_requests changes (affects stats and chart)
    _requestsSubscription = supabase
        .from('test_requests')
        .stream(primaryKey: ['id'])
        .listen((data) {
          loadDashboardData();
        }, onError: (error) {
          _errorMessage = error.toString();
          notifyListeners();
        });

    // Subscribe to profiles changes (affects user counts)
    _profilesSubscription = supabase
        .from('profiles')
        .stream(primaryKey: ['id'])
        .listen((data) {
          loadDashboardData();
        }, onError: (error) {
          _errorMessage = error.toString();
          notifyListeners();
        });
  }

  Future<void> loadDashboardData() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _stats = await _adminService.getDashboardStats();
      _dailyStats = await _adminService.getDailyRequestStats(daysBack: 30);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    await loadDashboardData();
  }

  /// Unsubscribe from real-time updates
  void unsubscribe() {
    _requestsSubscription?.cancel();
    _profilesSubscription?.cancel();
  }

  @override
  void dispose() {
    unsubscribe();
    super.dispose();
  }
}
