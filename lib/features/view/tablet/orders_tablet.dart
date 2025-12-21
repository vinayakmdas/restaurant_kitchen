import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_role/core/constants/app_icons.dart';
import 'package:kitchen_role/core/constants/app_image.dart';
import 'package:kitchen_role/core/constants/app_strings.dart';
import 'package:kitchen_role/core/constants/app_text_styles.dart';
import 'package:kitchen_role/core/theme/colors.dart';
import 'package:kitchen_role/features/controller/kitchen_controller.dart';
import 'package:kitchen_role/features/view/widget/custom_order_filter_dropdown.dart';

import 'package:kitchen_role/features/view/widget/order_cart_widget.dart';
import 'package:kitchen_role/shared/widgets/app_text.dart';
import 'package:kitchen_role/shared/widgets/background_image.dart';
import 'package:kitchen_role/shared/widgets/order_status_card_tablet.dart';

class OrdersTabletView extends StatelessWidget {
  const OrdersTabletView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(KitchenController());

    return Scaffold(
      body: BackgroundImage(
        imagePath: AppImages.backgroundImage,
        gradient: const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black87,
            Colors.black54,
            Colors.transparent,
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
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
                const SizedBox(height: 20),

                // Status Cards
                Obx(() => Row(
                  children: [
                    Expanded(
                      child: OrderStatusCardTablet(
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
                      child: OrderStatusCardTablet(
                        borderColor: AppColors.statusPreparing,
                        title: AppStrings.preparing,
                        count: '${controller.preparingOrdersCount}',
                        icon: AppIcons.preparing,
                        backgroundColor: AppColors.cardDarkBrown,
                        iconColor: AppColors.iconOrange,
                        textColor: AppColors.textWhite,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: OrderStatusCardTablet(
                        borderColor: AppColors.statusCompleted,
                        backgroundColor: AppColors.cardDarkGreen,
                        title: AppStrings.completed,
                        count: '${controller.completedOrdersCount}',
                        icon: AppIcons.completed,
                        textColor: AppColors.textWhite,
                        iconColor: AppColors.iconGreen,
                      ),
                    ),
                  ],
                )),
                const SizedBox(height: 20),

                // Filter Dropdown
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const OrderFilterDropdown(),
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

                // Orders Grid - Use Wrap for better layout with expanded cards
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

                    return SingleChildScrollView(
                      child: Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: controller.filteredOrders.map((order) {
                          // Calculate width based on expanded state
                          double cardWidth = (MediaQuery.of(context).size.width - 72) / 2;
                          
                          return SizedBox(
                            width: cardWidth,
                            child: OrderCardWidget(order: order),
                          );
                        }).toList(),
                      ),
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