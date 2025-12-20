// core/colors.dart

import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primaryPurple = Color(0xFF7C3AED); // Purple accent
  static const Color primaryOrange = Color(0xFFEA580C); // Orange/Brown accent
  static const Color primaryGreen = Color(0xFF059669); // Green accent
  
  // Background Colors
  static const Color backgroundDark = Color(0xFF0A0A0A); // Main dark background
  static const Color cardDarkPurple = Color(0xFF2D1B4E); // New Orders card background
  static const Color cardDarkBrown = Color(0xFF431407); // Preparing card background
  static const Color cardDarkGreen = Color(0xFF064E3B); // Completed card background
  static const Color cardDark = Color(0xFF111827); // Order item card background
  
  // Text Colors
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textGray = Color(0xFF9CA3AF);
  static const Color textLightGray = Color(0xFFD1D5DB);
  
  // Status Colors
  static const Color statusNew = Color(0xFF7C3AED); // Purple for new orders
  static const Color statusPreparing = Color(0xFFEA580C); // Orange/Brown for preparing
  static const Color statusReady = Color(0xFF059669); // Green for food ready
  static const Color statusCompleted = Color(0xFF10B981); // Bright green for completed
  
  // Button Colors
  static const Color buttonPurple = Color(0xFF6D28D9); // Purple button
  static const Color buttonOrange = Color(0xFF9A3412); // Orange/Brown button
  static const Color buttonGreen = Color(0xFF065F46); // Green button
  
  // Border & Divider Colors
  static const Color borderDark = Color(0xFF1F2937);
  static const Color dividerColor = Color(0xFF374151);
  
  // Icon Colors
  static const Color iconPurple = Color(0xFF9333EA);
  static const Color iconOrange = Color(0xFFF97316);
  static const Color iconGreen = Color(0xFF10B981);
  
  // Opacity Overlays
  static Color purpleOverlay = const Color(0xFF7C3AED).withOpacity(0.1);
  static Color orangeOverlay = const Color(0xFFEA580C).withOpacity(0.1);
  static Color greenOverlay = const Color(0xFF059669).withOpacity(0.1);
}