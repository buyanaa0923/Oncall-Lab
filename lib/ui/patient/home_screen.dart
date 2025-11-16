import 'package:flutter/material.dart';
import 'package:oncall_lab/core/constants/app_colors.dart';
import 'package:oncall_lab/core/services/supabase_service.dart';
import 'package:oncall_lab/stores/auth_store.dart';
import 'package:oncall_lab/data/models/profile_model.dart';
import 'package:oncall_lab/ui/patient/widgets/visit_options_section.dart';
import 'package:oncall_lab/ui/patient/widgets/test_types_section.dart';
import 'dart:async';

import 'package:oncall_lab/ui/patient/widgets/available_doctors_section.dart';
import 'package:oncall_lab/ui/patient/all_lab_services_screen.dart';
import 'package:oncall_lab/ui/patient/direct_services_screen.dart';
import 'package:oncall_lab/ui/shared/widgets/profile_avatar.dart';

class PatientHomeScreen extends StatefulWidget {
  final VoidCallback onNavigateToProfile;

  const PatientHomeScreen({
    super.key,
    required this.onNavigateToProfile,
  });

  @override
  State<PatientHomeScreen> createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen>
    with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> testTypes = [];
  List<Map<String, dynamic>> availableDoctors = [];
  bool isLoading = true;
  String? errorMessage;

  late final AnimationController _waveController;
  late final Animation<double> _waveAnimation;

  @override
  void initState() {
    super.initState();
    _loadData();
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _waveAnimation =
        Tween<double>(begin: -0.12, end: 0.12).animate(CurvedAnimation(
      parent: _waveController,
      curve: Curves.easeInOut,
    ));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _waveController.repeat(reverse: true);
      Timer(const Duration(seconds: 4), () {
        if (mounted) {
          _waveController.forward(from: 0);
          _waveController.stop();
        }
      });
    });
  }

  @override
  void dispose() {
    _waveController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    try {
      // Load lab test services (for quick access on home screen)
      final servicesData = await supabase
          .from('services')
          .select('''
            *,
            service_categories(*)
          ''')
          .eq('is_active', true)
          .eq('service_categories.type', 'lab_test')
          .order('name')
          .limit(10);

      // Load available doctors
      final doctorsData = await supabase.rpc('get_available_doctors');

      setState(() {
        testTypes = List<Map<String, dynamic>>.from(servicesData);
        availableDoctors = List<Map<String, dynamic>>.from(doctorsData);
        isLoading = false;
      });
    } catch (e) {
      debugPrint('Error loading data: $e');
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: AppColors.primary,
        ),
      );
    }

    if (errorMessage != null) {
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
              const Text(
                'Error loading data',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                errorMessage!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.grey),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isLoading = true;
                    errorMessage = null;
                  });
                  _loadData();
                },
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
          const SizedBox(height: 20),
          _buildHeader(),
          const SizedBox(height: 20),
          Expanded(
            child: RefreshIndicator(
              color: AppColors.primary,
              onRefresh: _loadData,
              displacement: 30,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VisitOptionsSection(
                      onClinicTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const AllLabServicesScreen()),
                        );
                      },
                      onHomeTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const DirectServicesScreen()),
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    TestTypesSection(testTypes: testTypes),
                    const SizedBox(height: 35),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Available doctors",
                        style: TextStyle(
                          fontSize: 22,
                          color: AppColors.black,
                          letterSpacing: -.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    AvailableDoctorsSection(doctors: availableDoctors),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    final profile = authStore.currentProfile;
    final displayName =
        (profile?.firstName?.isNotEmpty ?? false) ? profile!.firstName : profile?.displayName;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    displayName ?? 'Welcome',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 10),
                AnimatedBuilder(
                  animation: _waveAnimation,
                  builder: (_, child) {
                    return Transform.rotate(
                      angle: _waveAnimation.value,
                      child: child,
                    );
                  },
                  child: Image.asset(
                    "assets/images/hand.png",
                    height: 35,
                    width: 35,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: widget.onNavigateToProfile,
            child: ProfileAvatar(
              avatarUrl: profile?.getAvatarUrl(),
              initials: profile?.initials ?? 'U',
              radius: 27,
            ),
          ),
        ],
      ),
    );
  }

}
