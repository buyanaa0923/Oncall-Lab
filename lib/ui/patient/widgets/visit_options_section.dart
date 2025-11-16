import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:oncall_lab/core/constants/app_colors.dart';
import 'package:oncall_lab/ui/patient/widgets/visit_option_card.dart';

class VisitOptionsSection extends StatelessWidget {
  const VisitOptionsSection({
    super.key,
    required this.onClinicTap,
    required this.onHomeTap,
  });

  final VoidCallback onClinicTap;
  final VoidCallback onHomeTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: VisitOptionCard(
              icon: Icons.add,
              iconWeight: FontWeight.w700,
              iconSize: 28,
              title: 'Clinic visit',
              subtitle: 'Make an appointment',
              backgroundColor: AppColors.primary,
              titleColor: Colors.white,
              subtitleColor: Colors.white.withOpacity(0.8),
              iconBackgroundColor: Colors.white,
              iconColor: AppColors.primary,
              elevated: true,
              showWavyPattern: true,
              onTap: onClinicTap,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: VisitOptionCard(
              icon: Iconsax.home_2,
              iconFilled: true,
              title: 'Home visit',
              subtitle: 'Call the doctor home',
              backgroundColor: Colors.white,
              titleColor: AppColors.black,
              subtitleColor: AppColors.black,
              iconBackgroundColor: AppColors.primary.withOpacity(0.12),
              iconColor: AppColors.primary,
              elevated: false,
              onTap: onHomeTap,
            ),
          ),
        ],
      ),
    );
  }
}
