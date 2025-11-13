

import '../../widgets/ui_helper.dart';
import 'package:flutter/material.dart';


class OrdersListView extends StatelessWidget {
  final List<Map<String, String>> orders;
    final String emptyText;
  const OrdersListView({required this.orders, super.key, required this.emptyText});

  @override
  Widget build(BuildContext context) {
    if(orders.isEmpty){
      return Center(child: Text(emptyText),);
    }
    return ListView.separated(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return UiHelper.orderCard(
          name: order['name'] ?? "No Name",
          category: order['category'] ?? "No Category",
          price: order['price'] ?? "0",
        );
      },
      separatorBuilder: (context, index) => Divider(
        color: const Color(0xFF00A86B).withOpacity(0.4),
        thickness: 1,
        indent: 15,
        endIndent: 15,
      ),
    );
  }
}
