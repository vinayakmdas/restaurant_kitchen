// features/view/widget/order_card_widget.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_role/core/theme/colors.dart';
import 'package:kitchen_role/core/constants/app_text_styles.dart';
import 'package:kitchen_role/features/model/oreder_model.dart';

import 'package:kitchen_role/features/controller/kitchen_controller.dart';

class OrderCardWidget extends StatelessWidget {
  final Order order;

  const OrderCardWidget({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<KitchenController>();

    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderDark),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Order Header (Always visible) - Clickable
          InkWell(
            onTap: () => controller.toggleOrderExpansion(order.id),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Table Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: _getStatusColor(order.status),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      order.tableNumber,
                      style: AppTextStyles.tableNumber.copyWith(fontSize: 15),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Section & Time
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.section,
                          style: AppTextStyles.sectionName.copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          order.time,
                          style: AppTextStyles.timeStamp.copyWith(fontSize: 13),
                        ),
                      ],
                    ),
                  ),

                  // Status Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: _getStatusColor(order.status),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      _getStatusLabel(order.status),
                      style: AppTextStyles.buttonTextMedium.copyWith(fontSize: 12),
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Expand/Collapse Icon - Arrow DOWN when collapsed, UP when expanded
                  Icon(
                    order.isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: AppColors.textGray,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),

          // Order Items (Show ONLY when expanded)
          if (order.isExpanded) ...[
            const Divider(color: AppColors.borderDark, height: 1),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Order Items',
                    style: AppTextStyles.sectionHeader.copyWith(fontSize: 15),
                  ),
                  const SizedBox(height: 12),

                  // Items List
                  ...order.items.map((item) => _buildOrderItem(item)),

                  // Action Button based on status
                  if (order.status == 'new') ...[
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => controller.startPreparingAllItems(order.id),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7F1D1D),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Start Preparing All',
                          style: AppTextStyles.buttonTextLarge.copyWith(fontSize: 14),
                        ),
                      ),
                    ),
                  ],

                  if (order.status == 'preparing') ...[
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => controller.markAllAsFoodReady(order.id),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.statusReady,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Mark All as Food Ready',
                          style: AppTextStyles.buttonTextLarge.copyWith(fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildOrderItem(OrderItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.backgroundDark,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderDark),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                item.type == 'Vegetarian' ? Icons.circle : Icons.whatshot,
                color: item.type == 'Vegetarian' ? Colors.green : Colors.red,
                size: 14,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  item.name,
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Item Details
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              _buildBadge(item.type, item.type == 'Vegetarian' ? Colors.green : Colors.red),
              _buildBadge('Qty: ${item.quantity}', AppColors.textGray),
              _buildBadge('Size: ${item.size}', AppColors.textGray),
              _buildBadge(item.category, Colors.amber.shade700),
            ],
          ),

          // Special Instructions
          if (item.specialInstructions != null) ...[
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.orange.shade900.withOpacity(0.2),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.orange.shade700),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: Colors.orange, size: 14),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      item.specialInstructions!,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: Colors.orange.shade200,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBadge(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'new':
        return AppColors.statusNew;
      case 'preparing':
        return AppColors.statusPreparing;
      case 'completed':
        return AppColors.statusCompleted;
      default:
        return AppColors.primaryPurple;
    }
  }

  String _getStatusLabel(String status) {
    switch (status) {
      case 'new':
        return 'New Order';
      case 'preparing':
        return 'Preparing';
      case 'completed':
        return 'Food Ready';
      default:
        return status;
    }
  }
}