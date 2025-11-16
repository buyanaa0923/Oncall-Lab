import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:oncall_lab/core/constants/app_colors.dart';

class LaboratoryDetailScreen extends StatelessWidget {
  const LaboratoryDetailScreen({super.key, required this.laboratory});

  final Map<String, dynamic> laboratory;

  @override
  Widget build(BuildContext context) {
    final operatingHours = laboratory['operating_hours'] as Map<String, dynamic>?;
    final latitude = laboratory['latitude'];
    final longitude = laboratory['longitude'];

    return Scaffold(
      appBar: AppBar(
        title: Text(laboratory['name'] ?? 'Laboratory'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _InfoTile(
                icon: Iconsax.location,
                title: 'Address',
                value: laboratory['address'] ?? 'Not specified',
              ),
              const SizedBox(height: 12),
              _InfoTile(
                icon: Iconsax.call,
                title: 'Phone',
                value: laboratory['phone_number'] ?? 'Not specified',
              ),
              const SizedBox(height: 12),
              _InfoTile(
                icon: Iconsax.sms,
                title: 'Email',
                value: laboratory['email'] ?? 'Not specified',
              ),
              const SizedBox(height: 12),
              if (latitude != null && longitude != null)
                _InfoTile(
                  icon: Iconsax.map,
                  title: 'Coordinates',
                  value: '$latitude, $longitude',
                ),
              if (operatingHours != null) ...[
                const SizedBox(height: 24),
                const Text(
                  'Operating Hours',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 12),
                ...operatingHours.entries.map(
                  (entry) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    leading: const Icon(
                      Iconsax.clock,
                      size: 18,
                      color: AppColors.primary,
                    ),
                    title: Text(
                      entry.key,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                    subtitle: Text(
                      entry.value.toString(),
                      style: const TextStyle(color: AppColors.grey),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 24),
              _InfoTile(
                icon: Iconsax.information,
                title: 'Status',
                value: (laboratory['is_active'] == true)
                    ? 'Accepting requests'
                    : 'Temporarily unavailable',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
