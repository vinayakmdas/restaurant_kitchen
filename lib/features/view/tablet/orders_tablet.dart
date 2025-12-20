import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:kitchen_role/core/constants/app_icons.dart';
import 'package:kitchen_role/core/constants/app_image.dart';
import 'package:kitchen_role/core/constants/app_strings.dart';
import 'package:kitchen_role/core/constants/app_text_styles.dart';
import 'package:kitchen_role/core/theme/colors.dart';
import 'package:kitchen_role/features/controller/order_filter_controller.dart';
import 'package:kitchen_role/features/view/widget/custom_order_filter_dropdown.dart';

import 'package:kitchen_role/shared/widgets/app_text.dart' show AppText;
import 'package:kitchen_role/shared/widgets/background_image.dart';
import 'package:kitchen_role/shared/widgets/order_status_card.dart';

class OrdersTabletView
 extends StatelessWidget {
  const OrdersTabletView
  ({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderFilterController());
    return Scaffold(
      body:  BackgroundImage(
        imagePath: AppImages.backgroundImage,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
            child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.kitchen, color: AppColors.iconPurple, size: 30),
                          const SizedBox(width: 10),
                          AppText(
                            AppStrings.sideName,
                            style: AppTextStyles.pageHeader,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                       Row(
                        children: [
                          AppText(
                            AppStrings.subHeading,
                            style: AppTextStyles.pageSubtitle,
                          ),
                        ],
                      ),

                      SizedBox(height: 20),
                      Row(
  children: [
    Expanded(
      child: OrderStatusCard(
        borderColor: AppColors.statusNew,
        title: AppStrings.newOrders,
        count: '12',
        icon: AppIcons.newOrder,
        backgroundColor: AppColors.cardDarkPurple,
        iconColor: AppColors.iconPurple,
        textColor: AppColors.textWhite,  
      ),
    ),
    const SizedBox(width: 16),

    Expanded(
      child: OrderStatusCard(
       borderColor: AppColors.statusPreparing,
        title: AppStrings.preparing,
        count: '8',
        icon: AppIcons.preparing,
        backgroundColor: AppColors.cardDarkBrown,
         iconColor: AppColors.iconOrange,
          textColor: AppColors.textWhite
      ),
    ),
    const SizedBox(width: 16),

    Expanded(
      child: OrderStatusCard(
        borderColor: AppColors.statusCompleted,
        backgroundColor: AppColors.cardDarkGreen,
        title: AppStrings.completed,
        count: '20',
        icon: AppIcons.completed,
       textColor: AppColors.textWhite,
        iconColor: AppColors.iconGreen,
      ),
    ),
  ],
),
const SizedBox(height: 20),
  Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const OrderFilterDropdown(),
    ],
  ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}