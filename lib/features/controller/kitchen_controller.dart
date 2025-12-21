// features/controller/kitchen_controller.dart

import 'package:get/get.dart';
import 'package:kitchen_role/features/model/order_filter_model.dart';
import 'package:kitchen_role/features/model/oreder_model.dart';


class KitchenController extends GetxController {
  // All orders
  final RxList<Order> allOrders = <Order>[].obs;
  
  // Filtered orders
  final RxList<Order> filteredOrders = <Order>[].obs;
  
  // Selected filter
  final Rx<OrderFilter> selectedFilter = OrderFilter(
    id: '1',
    label: 'All Orders',
    value: 'all',
  ).obs;
  
  // Filters list
  final RxList<OrderFilter> filters = <OrderFilter>[].obs;
  
  // Dropdown focus state
  final RxBool isFocused = false.obs;

  @override
  void onInit() {
    super.onInit();
    filters.value = OrderFilter.getFilters();
    _loadDummyOrders();
    _filterOrders();
  }

  // Load dummy orders
  void _loadDummyOrders() {
    allOrders.value = [
      Order(
        id: '1',
        tableNumber: 'Table 5',
        section: 'AC Section',
        time: '10:30 AM',
        status: 'new',
        items: [
          OrderItem(
            id: '1',
            name: 'Butter Chicken',
            type: 'Non-Vegetarian',
            quantity: 2,
            size: 'Full',
            category: 'Curry',
            specialInstructions: 'Curry with less salt, extra spicy',
          ),
          OrderItem(
            id: '2',
            name: 'Basmati Rice',
            type: 'Vegetarian',
            quantity: 2,
            size: 'Half',
            category: 'Rice',
          ),
          OrderItem(
            id: '3',
            name: 'Garlic Naan',
            type: 'Vegetarian',
            quantity: 3,
            size: 'Full',
            category: 'Bread',
          ),
        ],
      ),
      Order(
        id: '2',
        tableNumber: 'Table 3',
        section: 'Non-AC Section',
        time: '10:35 AM',
        status: 'new',
        items: [
          OrderItem(
            id: '4',
            name: 'Paneer Tikka',
            type: 'Vegetarian',
            quantity: 1,
            size: 'Full',
            category: 'Curry',
          ),
        ],
      ),
      Order(
        id: '3',
        tableNumber: 'Table 8',
        section: 'AC Section',
        time: '10:25 AM',
        status: 'preparing',
        items: [
          OrderItem(
            id: '5',
            name: 'Chicken Biryani',
            type: 'Non-Vegetarian',
            quantity: 2,
            size: 'Full',
            category: 'Meal',
          ),
          OrderItem(
            id: '6',
            name: 'Raita',
            type: 'Vegetarian',
            quantity: 2,
            size: 'Full',
            category: 'Curry',
            specialInstructions: 'No onions in raita',
          ),
        ],
      ),
      Order(
        id: '4',
        tableNumber: 'Table 12',
        section: 'AC Section',
        time: '10:20 AM',
        status: 'preparing',
        items: [
          OrderItem(
            id: '7',
            name: 'Dal Makhani',
            type: 'Vegetarian',
            quantity: 1,
            size: 'Full',
            category: 'Curry',
          ),
        ],
      ),
      Order(
        id: '5',
        tableNumber: 'Table 7',
        section: 'Non-AC Section',
        time: '10:15 AM',
        status: 'completed',
        items: [
          OrderItem(
            id: '8',
            name: 'Masala Dosa',
            type: 'Vegetarian',
            quantity: 2,
            size: 'Full',
            category: 'Meal',
          ),
        ],
      ),
    ];
  }

  // Filter orders based on selected filter
  void _filterOrders() {
    if (selectedFilter.value.value == 'all') {
      filteredOrders.value = List.from(allOrders);
    } else {
      filteredOrders.value = allOrders
          .where((order) => order.status == selectedFilter.value.value)
          .toList();
    }
  }

  // Change filter
  void changeFilter(OrderFilter filter) {
    selectedFilter.value = filter;
    _filterOrders();
  }

  // Toggle order expansion
  void toggleOrderExpansion(String orderId) {
    final index = filteredOrders.indexWhere((order) => order.id == orderId);
    if (index != -1) {
      filteredOrders[index] = filteredOrders[index].copyWith(
        isExpanded: !filteredOrders[index].isExpanded,
      );
      filteredOrders.refresh();
    }
  }

  // Start preparing all items in an order
  void startPreparingAllItems(String orderId) {
    final orderIndex = allOrders.indexWhere((order) => order.id == orderId);
    if (orderIndex != -1) {
      allOrders[orderIndex] = allOrders[orderIndex].copyWith(status: 'preparing');
      _filterOrders();
    }
  }

  // Mark all items as food ready
  void markAllAsFoodReady(String orderId) {
    final orderIndex = allOrders.indexWhere((order) => order.id == orderId);
    if (orderIndex != -1) {
      allOrders[orderIndex] = allOrders[orderIndex].copyWith(status: 'completed');
      _filterOrders();
    }
  }

  // Get counts
  int get newOrdersCount => allOrders.where((o) => o.status == 'new').length;
  int get preparingOrdersCount => allOrders.where((o) => o.status == 'preparing').length;
  int get completedOrdersCount => allOrders.where((o) => o.status == 'completed').length;
  int get totalOrdersCount => allOrders.length;
}