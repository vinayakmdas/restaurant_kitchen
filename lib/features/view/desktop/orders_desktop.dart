import 'package:flutter/material.dart';
import 'package:kitchen_role/core/constants/app_image.dart';
import 'package:kitchen_role/core/theme/colors.dart';
import 'package:kitchen_role/shared/widgets/background_image.dart';

class OrdersDesktopView extends StatelessWidget {
  const OrdersDesktopView({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        imagePath: AppImages.backgroundImage,
        overlayColor: Colors.black.withOpacity(0.4), // optional
        child: SafeArea(
          child: Center(
            child: Text(
              'Orders Desktop View',
              style: TextStyle(color: AppColors.textWhite, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}