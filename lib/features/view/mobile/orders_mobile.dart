

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kitchen_role/core/constants/app_icons.dart';
import 'package:kitchen_role/core/constants/app_image.dart';
import 'package:kitchen_role/core/constants/app_strings.dart';
import 'package:kitchen_role/core/constants/app_text_styles.dart';
import 'package:kitchen_role/core/theme/colors.dart';
import 'package:kitchen_role/features/controller/kitchen_controller.dart';
import 'package:kitchen_role/features/view/widget/custome_order_dropdown_mobile.dart';
import 'package:kitchen_role/features/view/widget/order_card_mobile.dart';
import 'package:kitchen_role/shared/widgets/app_text.dart';
import 'package:kitchen_role/shared/widgets/background_image.dart';
import 'package:kitchen_role/shared/widgets/order_status_card_mobile.dart';

class OrdersMobileView extends StatelessWidget {
  const OrdersMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(KitchenController());
    return Scaffold(
      body: BackgroundImage(
        imagePath: AppImages.backgroundImage,
        gradient: const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black87, Colors.black54, Colors.transparent],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.kitchen,
                      color: AppColors.iconPurple,
                      size: 30,
                    ),
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
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OrderStatusCardMobile(
                        borderColor: AppColors.statusNew,
                        title: AppStrings.newOrders,
                        count: '${controller.newOrdersCount}',
                        icon: AppIcons.newOrder,
                        backgroundColor: AppColors.cardDarkPurple,
                        iconColor: AppColors.iconPurple,
                        textColor: AppColors.textWhite,
                      ),
                    ),

                    const SizedBox(width: 16),
                    Expanded(
                      child: OrderStatusCardMobile(
                        borderColor: AppColors.statusPreparing,
                        title: AppStrings.preparing,
                        count: '${controller.preparingOrdersCount}',
                        icon: AppIcons.preparing,
                        backgroundColor: AppColors.cardDarkBrown,
                        iconColor: AppColors.iconOrange,
                        textColor: AppColors.textWhite,
                      ),
                    ),
  SizedBox(width: 16,),
                    Expanded(child: 
                       OrderStatusCardMobile(
                      borderColor: AppColors.statusCompleted,
                        backgroundColor: AppColors.cardDarkGreen,
                        title: AppStrings.completed,
                        count: '${controller.completedOrdersCount}',
                        icon: AppIcons.completed,
                        textColor: AppColors.textWhite,
                        iconColor: AppColors.iconGreen,
                        )
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                 Row( 
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(child: const OrderFilterDropdownMobile()),
                  ],
                ), 
                const SizedBox(height: 20),

                  // Orders List Header
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      'All Orders',
                      style: AppTextStyles.sectionHeader,
                    ),
                    AppText(
                      '${controller.filteredOrders.length} orders',
                      style: AppTextStyles.orderCount,
                    ),
                  ],
                )),
                const SizedBox(height: 16),
                 Expanded(
                  child: Obx(() {
                    if (controller.filteredOrders.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.inbox_outlined,
                              size: 64,
                              color: AppColors.textGray,
                            ),
                            const SizedBox(height: 16),
                            AppText(
                              'No orders found',
                              style: AppTextStyles.bodyLarge.copyWith(
                                color: AppColors.textGray,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    // Check if any order is expanded
                    // bool hasExpandedOrder = controller.filteredOrders.any((o) => o.isExpanded);

                    return ListView.separated(
  padding: EdgeInsets.zero,
  itemCount: controller.filteredOrders.length,
  separatorBuilder: (_, __) => const SizedBox(height: 16),
  itemBuilder: (context, index) {
    final order = controller.filteredOrders[index];
    return OrderCardWidgetMobile(
      order: order,
    );
  },
);
 
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
