import 'dart:async';
import 'package:flutter/foundation.dart';
import '../models/user_model.dart';
import '../services/admin_service.dart';
import '../services/supabase_service.dart';

class UsersProvider with ChangeNotifier {
  final AdminService _adminService = AdminService();

  List<UserModel> _users = [];
  bool _isLoading = false;
  String? _errorMessage;
  StreamSubscription? _usersSubscription;
  StreamSubscription? _doctorProfilesSubscription;

  List<UserModel> get users => _users;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  List<UserModel> get patients => _users.where((u) => u.role == 'patient').toList();
  List<UserModel> get doctors => _users.where((u) => u.role == 'doctor').toList();
  List<UserModel> get unverifiedDoctors =>
      _users.where((u) => u.role == 'doctor' && !u.isVerified).toList();

  /// Subscribe to real-time user updates
  void subscribeToUsers() {
    // Cancel existing subscription
    _usersSubscription?.cancel();
    _doctorProfilesSubscription?.cancel();

    // Initial load
    loadUsers();

    // Subscribe to profiles table changes
    _usersSubscription = supabase
        .from('profiles')
        .stream(primaryKey: ['id'])
        .listen((data) {
          _handleProfilesUpdate(data);
        }, onError: (error) {
          _errorMessage = error.toString();
          notifyListeners();
        });

    // Subscribe to doctor_profiles table changes
    _doctorProfilesSubscription = supabase
        .from('doctor_profiles')
        .stream(primaryKey: ['user_id'])
        .listen((data) {
          // Reload users when doctor profiles change
          loadUsers();
        }, onError: (error) {
          _errorMessage = error.toString();
          notifyListeners();
        });
  }

  void _handleProfilesUpdate(List<Map<String, dynamic>> data) async {
    // Reload full user data to get joined information
    await loadUsers();
  }

  Future<void> loadUsers() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _users = await _adminService.getAllUsers();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> updateUserVerification(String userId, bool isVerified) async {
    try {
      await _adminService.updateUserVerification(userId, isVerified);
      await loadUsers(); // Reload data
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> updateUserActiveStatus(String userId, bool isActive) async {
    try {
      await _adminService.updateUserActiveStatus(userId, isActive);
      await loadUsers(); // Reload data
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> updateDoctorAvailability(String doctorId, bool isAvailable) async {
    try {
      await _adminService.updateDoctorAvailability(doctorId, isAvailable);
      await loadUsers(); // Reload data
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> deleteUser(String userId) async {
    try {
      await _adminService.deleteUser(userId);
      await loadUsers(); // Reload data
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<void> refresh() async {
    await loadUsers();
  }

  /// Unsubscribe from real-time updates
  void unsubscribe() {
    _usersSubscription?.cancel();
    _doctorProfilesSubscription?.cancel();
  }

  @override
  void dispose() {
    unsubscribe();
    super.dispose();
  }
}
