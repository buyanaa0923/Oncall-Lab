import 'package:flutter/material.dart';
import 'package:oncall_lab/core/constants/app_colors.dart';
import 'package:oncall_lab/l10n/app_localizations.dart';

class SavedAddressSelector extends StatelessWidget {
  const SavedAddressSelector({
    super.key,
    required this.address,
    required this.selected,
    required this.onUseAddress,
    required this.onManualEntry,
  });

  final String address;
  final bool selected;
  final VoidCallback onUseAddress;
  final VoidCallback onManualEntry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected
                  ? AppColors.primary
                  : AppColors.primary.withValues(alpha: 0.2),
              width: selected ? 2 : 1,
            ),
          ),
          child: ListTile(
            onTap: onUseAddress,
            title: Text(
              address,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: Icon(
              selected ? Icons.check_circle : Icons.radio_button_unchecked,
              color: selected ? AppColors.primary : AppColors.grey,
            ),
          ),
        ),
        const SizedBox(height: 8),
        TextButton.icon(
          onPressed: selected ? onManualEntry : onUseAddress,
          icon: Icon(
            selected ? Icons.edit_location_alt : Icons.check_circle,
          ),
          label: Text(
            selected ? l10n.typeDifferentAddress : l10n.useSavedAddress,
          ),
        ),
      ],
    );
  }
}
