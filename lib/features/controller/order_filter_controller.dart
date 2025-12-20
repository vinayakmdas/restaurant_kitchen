// controllers/order_filter_controller.dart

import 'package:get/get.dart';
import 'package:kitchen_role/features/model/order_filter_model.dart';


class OrderFilterController extends GetxController {
  // Observable selected filter
  final Rx<OrderFilter> selectedFilter = OrderFilter(
    id: '1',
    label: 'All Orders',
    value: 'all',
  ).obs;

  // List of all filters
  final RxList<OrderFilter> filters = <OrderFilter>[].obs;

  // Observable focus state
  final RxBool isFocused = false.obs;

  @override
  void onInit() {
    super.onInit();
    filters.value = OrderFilter.getFilters();
  }

  // Change filter method
  void changeFilter(OrderFilter filter) {
    selectedFilter.value = filter;
    print('Filter changed to: ${filter.label}');
  }

  // Get filtered orders count (example)
  int getFilteredOrdersCount() {
    switch (selectedFilter.value.value) {
      case 'new':
        return 2;
      case 'preparing':
        return 2;
      case 'completed':
        return 1;
      default:
        return 5;
    }
  }
}