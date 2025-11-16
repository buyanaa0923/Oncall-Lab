import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../providers/users_provider.dart';
import '../../models/user_model.dart';
import '../../widgets/common/modern_data_table.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  String _filterRole = 'all';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UsersProvider>().subscribeToUsers();
    });
  }

  @override
  void dispose() {
    context.read<UsersProvider>().unsubscribe();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('User Management'),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Consumer<UsersProvider>(
            builder: (context, provider, _) {
              return IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: provider.isLoading ? null : () => provider.refresh(),
              );
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Consumer<UsersProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading && provider.users.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.errorMessage != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error: ${provider.errorMessage}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => provider.refresh(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          final users = _filterRole == 'all'
              ? provider.users
              : provider.users.where((u) => u.role == _filterRole).toList();

          return Column(
            children: [
              _buildFilterSection(provider),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: users.isEmpty
                      ? const Center(child: Text('No users found'))
                      : ModernDataTable(
                          columns: const [
                            DataColumn(label: Text('Name', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Role', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Phone', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Email', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Verified', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Created', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Actions', style: TextStyle(fontWeight: FontWeight.bold))),
                          ],
                          rows: users.map((user) => _buildUserRow(user, provider)).toList(),
                        ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFilterSection(UsersProvider provider) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          ModernFilterChip(
            label: 'All (${provider.users.length})',
            selected: _filterRole == 'all',
            onSelected: () => setState(() => _filterRole = 'all'),
          ),
          ModernFilterChip(
            label: 'Patients (${provider.patients.length})',
            selected: _filterRole == 'patient',
            onSelected: () => setState(() => _filterRole = 'patient'),
          ),
          ModernFilterChip(
            label: 'Doctors (${provider.doctors.length})',
            selected: _filterRole == 'doctor',
            onSelected: () => setState(() => _filterRole = 'doctor'),
          ),
          ModernFilterChip(
            label: 'Admins (${provider.users.where((u) => u.role == 'admin').length})',
            selected: _filterRole == 'admin',
            onSelected: () => setState(() => _filterRole = 'admin'),
          ),
        ],
      ),
    );
  }

  DataRow _buildUserRow(UserModel user, UsersProvider provider) {
    return DataRow(
      cells: [
        DataCell(Text(user.displayName, style: const TextStyle(fontWeight: FontWeight.w500))),
        DataCell(StatusBadge(
          text: user.role.toUpperCase(),
          color: _getRoleColor(user.role),
        )),
        DataCell(Text(user.phoneNumber)),
        DataCell(Text(user.email ?? 'N/A', style: TextStyle(color: user.email == null ? Colors.grey : null))),
        DataCell(StatusBadge(
          text: user.isActive ? 'Active' : 'Inactive',
          color: user.isActive ? Colors.green : Colors.red,
        )),
        DataCell(user.role == 'doctor'
            ? StatusBadge(
                text: user.isVerified ? 'Verified' : 'Pending',
                color: user.isVerified ? Colors.green : Colors.orange,
              )
            : const Text('N/A', style: TextStyle(color: Colors.grey))),
        DataCell(Text(DateFormat('MMM d, y').format(user.createdAt))),
        DataCell(_buildActions(user, provider)),
      ],
    );
  }

  Color _getRoleColor(String role) {
    switch (role) {
      case 'patient':
        return Colors.blue;
      case 'doctor':
        return Colors.green;
      case 'admin':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  Widget _buildActions(UserModel user, UsersProvider provider) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(
            user.isActive ? Icons.block : Icons.check_circle,
            color: user.isActive ? Colors.red : Colors.green,
            size: 20,
          ),
          tooltip: user.isActive ? 'Deactivate' : 'Activate',
          onPressed: () => _toggleUserStatus(user, provider),
        ),
        if (user.role == 'doctor' && !user.isVerified)
          IconButton(
            icon: const Icon(Icons.verified, color: Colors.orange, size: 20),
            tooltip: 'Verify Doctor',
            onPressed: () => _verifyDoctor(user, provider),
          ),
        IconButton(
          icon: const Icon(Icons.delete, color: Colors.red, size: 20),
          tooltip: 'Delete User',
          onPressed: () => _deleteUser(user, provider),
        ),
      ],
    );
  }

  Future<void> _toggleUserStatus(UserModel user, UsersProvider provider) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(user.isActive ? 'Deactivate User' : 'Activate User'),
        content: Text(
          user.isActive
              ? 'Are you sure you want to deactivate ${user.displayName}?'
              : 'Are you sure you want to activate ${user.displayName}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final success = await provider.updateUserActiveStatus(user.id, !user.isActive);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(success ? 'User status updated' : 'Failed to update user status'),
            backgroundColor: success ? Colors.green : Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _verifyDoctor(UserModel user, UsersProvider provider) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Verify Doctor'),
        content: Text('Are you sure you want to verify ${user.displayName}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Verify'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final success = await provider.updateUserVerification(user.id, true);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(success ? 'Doctor verified successfully' : 'Failed to verify doctor'),
            backgroundColor: success ? Colors.green : Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _deleteUser(UserModel user, UsersProvider provider) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete User'),
        content: Text(
          'Are you sure you want to delete ${user.displayName}? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final success = await provider.deleteUser(user.id);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(success
                ? 'User deleted successfully'
                : provider.errorMessage ?? 'Failed to delete user'),
            backgroundColor: success ? Colors.green : Colors.red,
          ),
        );
      }
    }
  }
}
