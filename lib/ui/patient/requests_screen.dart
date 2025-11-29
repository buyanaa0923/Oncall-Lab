import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oncall_lab/core/constants/app_colors.dart';
import 'package:oncall_lab/stores/auth_store.dart';
import 'package:oncall_lab/stores/test_request_store.dart';
import 'package:oncall_lab/data/models/test_request_model.dart';

class PatientRequestsScreen extends StatefulWidget {
  const PatientRequestsScreen({super.key});

  @override
  State<PatientRequestsScreen> createState() => _PatientRequestsScreenState();
}

class _PatientRequestsScreenState extends State<PatientRequestsScreen> {
  @override
  void initState() {
    super.initState();
    _subscribeToRequests();
  }

  void _subscribeToRequests() {
    final user = authStore.currentUser;
    if (user != null) {
      // Subscribe to real-time updates
      testRequestStore.subscribeToPatientRequests(user.id);
    }
  }

  Future<void> _refreshRequests() async {
    _subscribeToRequests();
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    testRequestStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (testRequestStore.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        }

        if (testRequestStore.errorMessage != null) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 60,
                    color: AppColors.error,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    testRequestStore.errorMessage!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: AppColors.grey),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _refreshRequests,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "My Requests",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.grey.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return TabBar(
                                indicatorColor: AppColors.primary,
                                padding: EdgeInsets.all(2),
                                dividerHeight: 0,
                                indicatorSize: TabBarIndicatorSize.tab,
                                labelStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                labelColor: Colors.white,
                                indicator: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                unselectedLabelStyle: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                                unselectedLabelColor:
                                    AppColors.black.withValues(alpha: 0.5),
                                tabs: [
                                  const Tab(text: 'Active'),
                                  const Tab(text: 'Completed'),
                                  const Tab(text: 'Cancelled'),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: TabBarView(
                          children: [
                            _buildRequestsList(
                                testRequestStore.activeRequests, 'active'),
                            _buildRequestsList(
                                testRequestStore.completedRequests,
                                'completed'),
                            _buildRequestsList(
                                testRequestStore.cancelledRequests,
                                'cancelled'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRequestsList(List<TestRequestModel> requests, String type) {
    if (requests.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'active'
                    ? Icons.calendar_today
                    : type == 'completed'
                        ? Icons.check_circle_outline
                        : Icons.cancel_outlined,
                size: 60,
                color: AppColors.grey.withValues(alpha: 0.5),
              ),
              const SizedBox(height: 20),
              Text(
                type == 'active'
                    ? 'No active requests'
                    : type == 'completed'
                        ? 'No completed requests'
                        : 'No cancelled requests',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Request a home service to get started',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _refreshRequests,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemCount: requests.length,
        itemBuilder: (context, index) {
          final request = requests[index];
          final statusStr = _getStatusString(request.status);

          return Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppColors.grey.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.secondary.withValues(alpha: 0.05),
                width: 1,
              ),
              // boxShadow: [
              //   BoxShadow(
              //     color: AppColors.getStatusColor(statusStr)
              //         .withValues(alpha: 0.1),
              //     blurRadius: 8,
              //     offset: const Offset(0, 2),
              //   ),
              // ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        _getRequestTitle(request),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.getStatusColor(statusStr)
                            .withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        AppColors.getStatusText(statusStr),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.getStatusColor(statusStr),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: request.requestType == RequestType.labService
                        ? Colors.blue.withValues(alpha: 0.1)
                        : Colors.purple.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    request.requestType == RequestType.labService
                        ? 'Lab Test Service'
                        : 'Direct Home Service',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: request.requestType == RequestType.labService
                          ? Colors.blue[700]
                          : Colors.purple[700],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 14,
                      color: AppColors.grey,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Scheduled: ${request.scheduledDate} ${request.scheduledTimeSlot ?? ''}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 14,
                      color: AppColors.grey,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        request.patientAddress,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.grey,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Price: ${request.priceMnt} MNT',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _getStatusString(RequestStatus status) {
    switch (status) {
      case RequestStatus.pending:
        return 'pending';
      case RequestStatus.accepted:
        return 'accepted';
      case RequestStatus.onTheWay:
        return 'on_the_way';
      case RequestStatus.sampleCollected:
        return 'sample_collected';
      case RequestStatus.deliveredToLab:
        return 'delivered_to_lab';
      case RequestStatus.completed:
        return 'completed';
      case RequestStatus.cancelled:
        return 'cancelled';
    }
  }

  String _getRequestTitle(TestRequestModel request) {
    // For now, return generic title - we'll need to fetch service names separately
    if (request.requestType == RequestType.labService) {
      return 'Lab Test Collection';
    } else {
      return 'Home Service Request';
    }
  }
}
