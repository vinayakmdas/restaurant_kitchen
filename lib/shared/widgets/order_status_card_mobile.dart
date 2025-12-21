import 'package:flutter/material.dart';
import 'package:kitchen_role/core/constants/app_text_styles.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_sizes.dart';

class OrderStatusCardMobile extends StatelessWidget {
  final String title;
  final String count;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final Color textColor;
  final Color borderColor;

  const OrderStatusCardMobile({
    super.key,
    required this.title,
    required this.count,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.textColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
        side: BorderSide(
          color: borderColor,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.sm,
          horizontal: AppSpacing.sm,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: AppSizes.iconMedium, // 🔹 smaller than tablet
              color: iconColor,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              title,
              style: AppTextStyles.bodySmall.copyWith(
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              count,
              style: AppTextStyles.pageSubtitle.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
