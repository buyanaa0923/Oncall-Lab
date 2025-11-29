import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oncall_lab/core/constants/app_colors.dart';
import 'package:oncall_lab/stores/auth_store.dart';
import 'package:oncall_lab/stores/test_request_store.dart';
import 'package:oncall_lab/data/models/test_request_model.dart';
import 'package:oncall_lab/l10n/app_localizations.dart';

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
    // Wait a bit for the stream to fetch initial data
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    testRequestStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

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
                    child: Text(l10n.retry),
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
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  l10n.myRequests,
                  style: const TextStyle(
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
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final tabWidth = (constraints.maxWidth - 12) / 3;
                              return TabBar(
                                indicatorColor: AppColors.primary,
                                unselectedLabelColor:
                                    AppColors.black.withValues(alpha: 0.5),
                                labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                                labelColor: Colors.white,
                                indicator: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                tabs: [
                                  SizedBox(
                                    width: tabWidth,
                                    child: Tab(text: l10n.activeRequests),
                                  ),
                                  SizedBox(
                                    width: tabWidth,
                                    child: Tab(text: l10n.completedRequests),
                                  ),
                                  SizedBox(
                                    width: tabWidth,
                                    child: Tab(text: l10n.cancelledCount),
                                  ),
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
                              testRequestStore.activeRequests,
                              'active',
                              l10n,
                            ),
                            _buildRequestsList(
                              testRequestStore.completedRequests,
                              'completed',
                              l10n,
                            ),
                            _buildRequestsList(
                              testRequestStore.cancelledRequests,
                              'cancelled',
                              l10n,
                            ),
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

  Widget _buildRequestsList(
    List<TestRequestModel> requests,
    String type,
    AppLocalizations l10n,
  ) {
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
                switch (type) {
                  'active' => l10n.noActiveRequests,
                  'completed' => l10n.noCompletedRequests,
                  _ => l10n.noCancelledRequests,
                },
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                l10n.requestHomeServicePrompt,
                textAlign: TextAlign.center,
                style: const TextStyle(
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
          final statusLabel = _getStatusLabel(request.status, l10n);

          return Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.getStatusColor(statusStr),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.getStatusColor(statusStr)
                      .withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        _getRequestTitle(request, l10n),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.getStatusColor(statusStr)
                            .withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        statusLabel,
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
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: request.requestType == RequestType.labService
                        ? Colors.blue.withValues(alpha: 0.1)
                        : Colors.purple.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    request.requestType == RequestType.labService
                        ? l10n.labTestServiceLabel
                        : l10n.directHomeServiceLabel,
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
                      l10n.scheduledAt(
                        request.scheduledDate,
                        request.scheduledTimeSlot ?? '',
                      ),
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
                  '${l10n.price}: ${l10n.priceInMNT(request.priceMnt)}',
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

  String _getRequestTitle(TestRequestModel request, AppLocalizations l10n) {
    return request.requestType == RequestType.labService
        ? l10n.labTestCollection
        : l10n.homeServiceRequest;
  }

  String _getStatusLabel(RequestStatus status, AppLocalizations l10n) {
    switch (status) {
      case RequestStatus.pending:
        return l10n.pending;
      case RequestStatus.accepted:
        return l10n.accepted;
      case RequestStatus.onTheWay:
        return l10n.onTheWay;
      case RequestStatus.sampleCollected:
        return l10n.sampleCollected;
      case RequestStatus.deliveredToLab:
        return l10n.deliveredToLab;
      case RequestStatus.completed:
        return l10n.completed;
      case RequestStatus.cancelled:
        return l10n.cancelled;
    }
  }
}
