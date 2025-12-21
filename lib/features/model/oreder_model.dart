// models/order_model.dart

class OrderItem {
  final String id;
  final String name;
  final String type; // Vegetarian, Non-Vegetarian
  final int quantity;
  final String size; // Full, Half
  final String category; // Curry, Rice, Bread, Meal
  final String? specialInstructions;

  OrderItem({
    required this.id,
    required this.name,
    required this.type,
    required this.quantity,
    required this.size,
    required this.category,
    this.specialInstructions,
  });
}

class Order {
  final String id;
  final String tableNumber;
  final String section; // AC Section, Non-AC Section
  final String time;
  final String status; // new, preparing, completed
  final List<OrderItem> items;
  final bool isExpanded;

  Order({
    required this.id,
    required this.tableNumber,
    required this.section,
    required this.time,
    required this.status,
    required this.items,
    this.isExpanded = false,
  });

  Order copyWith({
    String? id,
    String? tableNumber,
    String? section,
    String? time,
    String? status,
    List<OrderItem>? items,
    bool? isExpanded,
  }) {
    return Order(
      id: id ?? this.id,
      tableNumber: tableNumber ?? this.tableNumber,
      section: section ?? this.section,
      time: time ?? this.time,
      status: status ?? this.status,
      items: items ?? this.items,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}