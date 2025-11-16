import 'package:flutter/material.dart';
import 'package:oncall_lab/core/constants/app_colors.dart';
import 'package:oncall_lab/ui/patient/models/doctor_profile_ui.dart';
import 'package:oncall_lab/ui/patient/screens/doctor_detail_screen.dart';
import 'package:oncall_lab/ui/patient/widgets/doctor_card_tile.dart';

class AvailableDoctorsSection extends StatelessWidget {
  const AvailableDoctorsSection({
    super.key,
    required this.doctors,
  });

  final List<Map<String, dynamic>> doctors;

  @override
  Widget build(BuildContext context) {
    if (doctors.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'No doctors available at the moment',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.grey,
            ),
          ),
        ),
      );
    }

    final uiDoctors =
        doctors.map((e) => DoctorProfileUI.fromMap(e)).toList();

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        mainAxisExtent: 110,
      ),
      itemCount: uiDoctors.length,
      itemBuilder: (context, index) {
        final doctor = uiDoctors[index];
        return DoctorCardTile(
          doctor: doctor,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DoctorDetailScreen(doctor: doctor),
              ),
            );
          },
        );
      },
    );
  }
}
