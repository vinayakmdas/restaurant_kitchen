import 'package:flutter/material.dart';
import 'package:kitchen_role/features/view/desktop/orders_desktop.dart';
import 'package:kitchen_role/features/view/mobile/orders_mobile.dart';
import 'package:kitchen_role/features/view/tablet/orders_tablet.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1024) {
          return const OrdersDesktopView();
        } else if (constraints.maxWidth >= 600) {
          return const OrdersTabletView();
        } else {
          return const OrdersMobileView();
        }
      },
    );
  }
}
