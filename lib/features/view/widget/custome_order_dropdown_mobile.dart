import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_role/core/theme/colors.dart';
import 'package:kitchen_role/features/controller/kitchen_controller.dart';

class OrderFilterDropdownMobile extends StatelessWidget {
  const OrderFilterDropdownMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<KitchenController>();

    return Obx(
      () => PopupMenuButton<String>(
        offset: const Offset(0, 50),
        color: AppColors.cardDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(
            color: AppColors.primaryPurple,
            width: 1.2,
          ),
        ),
        onOpened: () => controller.isFocused.value = true,
        onCanceled: () => controller.isFocused.value = false,
        itemBuilder: (context) {
          return controller.filters.map((filter) {
            final isSelected =
                controller.selectedFilter.value.value == filter.value;

            return PopupMenuItem<String>(
              value: filter.value,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      filter.label,
                      style: TextStyle(
                        fontSize: 14,
                        color: isSelected
                            ? AppColors.primaryPurple
                            : AppColors.textWhite,
                      ),
                    ),
                  ),
                  if (isSelected)
                    const Icon(
                      Icons.check,
                      color: AppColors.primaryPurple,
                      size: 16,
                    ),
                ],
              ),
            );
          }).toList();
        },
        onSelected: (value) {
          controller.isFocused.value = false;
          final selectedFilter =
              controller.filters.firstWhere((f) => f.value == value);
          controller.changeFilter(selectedFilter);
        },

       
        child: Container(
          
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.cardDark,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: controller.isFocused.value
                  ? AppColors.primaryPurple
                  : Colors.blue,
              width: 0.6,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  controller.selectedFilter.value.label,
                  style: const TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 14,
                  ),
                ),
              ),
              Icon(
                controller.isFocused.value
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: controller.isFocused.value
                    ? AppColors.primaryPurple
                    : Colors.blue,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
