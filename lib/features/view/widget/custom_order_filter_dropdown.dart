// views/widgets/order_filter_dropdown.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_role/core/theme/colors.dart';
import 'package:kitchen_role/features/controller/kitchen_controller.dart';


class OrderFilterDropdown extends StatelessWidget {
  const OrderFilterDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<KitchenController>();

    return Obx(() => PopupMenuButton<String>(
      offset: const Offset(0, 55),
      color: AppColors.cardDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: AppColors.primaryPurple, width: 1.5),
      ),
      onOpened: () => controller.isFocused.value = true,
      onCanceled: () => controller.isFocused.value = false,
      itemBuilder: (context) {
        return controller.filters.map((filter) {
          final isSelected = controller.selectedFilter.value.value == filter.value;
          return PopupMenuItem<String>(
            value: filter.value,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    filter.label,
                    style: TextStyle(
                      fontSize: 15,
                      color: isSelected ? AppColors.primaryPurple : AppColors.textWhite,
                    ),
                  ),
                ),
                if (isSelected)
                  const Icon(Icons.check, color: AppColors.primaryPurple, size: 18),
              ],
            ),
          );
        }).toList();
      },
      onSelected: (value) {
        controller.isFocused.value = false;
        final selectedFilter = controller.filters.firstWhere((f) => f.value == value);
        controller.changeFilter(selectedFilter);
      },
      child: Container(
        width: 280,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: controller.isFocused.value ? AppColors.primaryPurple : Colors.blue,
            width: 0.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                controller.selectedFilter.value.label,
                style: const TextStyle(color: AppColors.textWhite, fontSize: 15),
              ),
            ),
            Icon(
              controller.isFocused.value ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: controller.isFocused.value ? AppColors.primaryPurple : Colors.blue,
              size: 20,
            ),
          ],
        ),
      ),
    ));
  }
}