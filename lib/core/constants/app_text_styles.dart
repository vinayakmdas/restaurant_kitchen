import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitchen_role/core/theme/colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // Page Headers
  static final TextStyle pageHeader = GoogleFonts.dmSans(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
  );

  static final TextStyle pageSubtitle = GoogleFonts.dmSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textGray,
  );


  // Card Numbers (Big numbers like "2", "1")
  static const TextStyle cardNumberLarge = TextStyle(
    fontSize: 64,
    fontWeight: FontWeight.bold,
    color: AppColors.textWhite,
    height: 1.0,
  );

  // Card Labels (New Orders, Preparing, Completed)
  static const TextStyle cardLabel = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
    letterSpacing: 0.3,
  );

  // Section Headers
  static const TextStyle sectionHeader = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
  );

  static const TextStyle sectionSubHeader = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textGray,
  );

  // Table Numbers
  static const TextStyle tableNumber = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
  );

  // Section Names (AC Section, Non-AC Section)
  static const TextStyle sectionName = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
  );

  // Time Stamps
  static const TextStyle timeStamp = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textGray,
  );

  // Button Text
  static const TextStyle buttonTextLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
  );

  static const TextStyle buttonTextMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
  );

  static const TextStyle buttonTextSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textWhite,
  );

  // Status Badge Text
  static const TextStyle statusBadge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
  );

  // Order Count Text
  static const TextStyle orderCount = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textGray,
  );

  // Dropdown Text
  static const TextStyle dropdownText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textWhite,
  );

  // Body Text
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textWhite,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textWhite,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textGray,
  );

  // Caption Text
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textGray,
  );

  // Subtle Text
  static const TextStyle subtle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textLightGray,
  );

}
