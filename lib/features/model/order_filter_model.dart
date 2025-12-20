// models/order_filter_model.dart

class OrderFilter {
  final String id;
  final String label;
  final String value;

  OrderFilter({
    required this.id,
    required this.label,
    required this.value,
  });

  static List<OrderFilter> getFilters() {
    return [
      OrderFilter(id: '1', label: 'All Orders', value: 'all'),
      OrderFilter(id: '2', label: 'New Orders', value: 'new'),
      OrderFilter(id: '3', label: 'Preparing Orders', value: 'preparing'),
      OrderFilter(id: '4', label: 'Completed Orders', value: 'completed'),
    ];
  }
}