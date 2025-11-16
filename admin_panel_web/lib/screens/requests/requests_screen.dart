import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../providers/requests_provider.dart';
import '../../models/request_model.dart';
import '../../widgets/common/modern_data_table.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  String _filterStatus = 'all';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RequestsProvider>().subscribeToRequests();
    });
  }

  @override
  void dispose() {
    context.read<RequestsProvider>().unsubscribe();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Requests'),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Consumer<RequestsProvider>(
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
      body: Consumer<RequestsProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading && provider.requests.isEmpty) {
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

          final requests = _filterStatus == 'all'
              ? provider.requests
              : provider.requests.where((r) => r.status == _filterStatus).toList();

          return Column(
            children: [
              _buildFilterSection(provider),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: requests.isEmpty
                      ? const Center(child: Text('No requests found'))
                      : ModernDataTable(
                          columns: const [
                            DataColumn(label: Text('Patient', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Doctor', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Service', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Type', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Price (MNT)', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Created', style: TextStyle(fontWeight: FontWeight.bold))),
                          ],
                          rows: requests.map((request) => _buildRequestRow(request)).toList(),
                        ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFilterSection(RequestsProvider provider) {
    final statusCounts = <String, int>{};
    for (var request in provider.requests) {
      statusCounts[request.status] = (statusCounts[request.status] ?? 0) + 1;
    }

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
            label: 'All (${provider.requests.length})',
            selected: _filterStatus == 'all',
            onSelected: () => setState(() => _filterStatus = 'all'),
          ),
          ModernFilterChip(
            label: 'Pending (${statusCounts['pending'] ?? 0})',
            selected: _filterStatus == 'pending',
            onSelected: () => setState(() => _filterStatus = 'pending'),
          ),
          ModernFilterChip(
            label: 'Accepted (${statusCounts['accepted'] ?? 0})',
            selected: _filterStatus == 'accepted',
            onSelected: () => setState(() => _filterStatus = 'accepted'),
          ),
          ModernFilterChip(
            label: 'Completed (${statusCounts['completed'] ?? 0})',
            selected: _filterStatus == 'completed',
            onSelected: () => setState(() => _filterStatus = 'completed'),
          ),
          ModernFilterChip(
            label: 'Cancelled (${statusCounts['cancelled'] ?? 0})',
            selected: _filterStatus == 'cancelled',
            onSelected: () => setState(() => _filterStatus = 'cancelled'),
          ),
        ],
      ),
    );
  }

  DataRow _buildRequestRow(RequestModel request) {
    return DataRow(
      cells: [
        DataCell(Text(request.patientName ?? 'N/A', style: const TextStyle(fontWeight: FontWeight.w500))),
        DataCell(Text(request.doctorName ?? 'Unassigned', style: TextStyle(color: request.doctorName == null ? Colors.grey : null))),
        DataCell(Text(request.serviceName ?? 'N/A')),
        DataCell(StatusBadge(
          text: request.requestType == 'lab_service' ? 'LAB' : 'DIRECT',
          color: request.requestType == 'lab_service' ? Colors.blue : Colors.green,
        )),
        DataCell(StatusBadge(
          text: request.status.toUpperCase().replaceAll('_', ' '),
          color: _getStatusColor(request.status),
        )),
        DataCell(Text(DateFormat('MMM d, y').format(request.scheduledDate))),
        DataCell(Text(NumberFormat('#,###').format(request.priceMnt))),
        DataCell(Text(DateFormat('MMM d').format(request.createdAt))),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'pending':
        return Colors.orange;
      case 'accepted':
        return Colors.blue;
      case 'on_the_way':
        return Colors.cyan;
      case 'sample_collected':
        return Colors.purple;
      case 'delivered_to_lab':
        return Colors.indigo;
      case 'completed':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
