import 'package:flutter/material.dart';
import 'package:kitchen_role/core/constants/app_text_styles.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_sizes.dart';
class OrderStatusCardTablet extends StatelessWidget {
  final String title;
  final String count;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final Color textColor;
  final Color borderColor; // ✅ add this

  const OrderStatusCardTablet({
    super.key,
    required this.title,
    required this.count,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.textColor,
    required this.borderColor, // ✅ required
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        side: BorderSide(              // ✅ border added
          color: borderColor,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: AppSizes.iconLarge, color: iconColor),
            const SizedBox(height: AppSpacing.sm),
            Text(
              title,
              style: AppTextStyles.pageSubtitle.copyWith(color: textColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              count,
              style: AppTextStyles.pageHeader.copyWith(color: textColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
