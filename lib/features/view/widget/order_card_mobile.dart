import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_role/core/theme/colors.dart';
import 'package:kitchen_role/core/constants/app_text_styles.dart';
import 'package:kitchen_role/features/model/oreder_model.dart';
import 'package:kitchen_role/features/controller/kitchen_controller.dart';

class OrderCardWidgetMobile extends StatelessWidget {
  final Order order;

  const OrderCardWidgetMobile({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<KitchenController>();

    return Container(
      width: double.infinity, // ✅ FULL WIDTH
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderDark),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
          InkWell(
            onTap: () => controller.toggleOrderExpansion(order.id),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  // Table Number
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: _getStatusColor(order.status),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      order.tableNumber,
                      style: AppTextStyles.tableNumber.copyWith(fontSize: 13),
                    ),
                  ),

                  const SizedBox(width: 10),

                  // Section + Time
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.section,
                          style: AppTextStyles.sectionName
                              .copyWith(fontSize: 14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          order.time,
                          style: AppTextStyles.timeStamp
                              .copyWith(fontSize: 11),
                        ),
                      ],
                    ),
                  ),

                  Icon(
                    order.isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: AppColors.textGray,
                  ),
                ],
              ),
            ),
          ),

          // EXPANDED CONTENT
          if (order.isExpanded) ...[
            const Divider(color: AppColors.borderDark, height: 1),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // STATUS
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getStatusColor(order.status),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        _getStatusLabel(order.status),
                        style: AppTextStyles.buttonTextMedium
                            .copyWith(fontSize: 11),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'Order Items',
                    style:
                        AppTextStyles.sectionHeader.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 10),

                  ...order.items.map(_buildOrderItem),

                  // ACTIONS
                  if (order.status == 'new') ...[
                    const SizedBox(height: 10),
                    _buildActionButton(
                      text: 'Start Preparing All',
                      color: const Color(0xFF7F1D1D),
                      onTap: () =>
                          controller.startPreparingAllItems(order.id),
                    ),
                  ],

                  if (order.status == 'preparing') ...[
                    const SizedBox(height: 10),
                    _buildActionButton(
                      text: 'Mark All as Food Ready',
                      color: AppColors.statusReady,
                      onTap: () =>
                          controller.markAllAsFoodReady(order.id),
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
      width: double.infinity, // ✅ FULL WIDTH ITEM
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
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
                item.type == 'Vegetarian'
                    ? Icons.circle
                    : Icons.whatshot,
                color:
                    item.type == 'Vegetarian' ? Colors.green : Colors.red,
                size: 12,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  item.name,
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              _buildBadge(item.type,
                  item.type == 'Vegetarian' ? Colors.green : Colors.red),
              _buildBadge('Qty: ${item.quantity}', AppColors.textGray),
              _buildBadge(item.category, Colors.amber),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: AppTextStyles.buttonTextLarge.copyWith(fontSize: 13),
        ),
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
          fontSize: 10,
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
