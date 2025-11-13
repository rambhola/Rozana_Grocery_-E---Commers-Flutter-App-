import 'package:rozana_grocery_app/repository/Screens/Orders/orders_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Profile/profile_screen.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  // Products data list
  final List<Map<String, String>> activeOrders = [
    {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    },
    {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    },
    {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    },
    {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    },
    {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    },
    {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    },
    {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    },
    {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    }, {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    },


  ];
  final List<Map<String,String>> completedOrders =  [
    {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    },
    {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    },
    {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    },
    {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    },
    {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    },
    {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    },
    {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    },
    {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    }, {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    },


  ];
  final List<Map<String,String>> cancelledOrders =  [
    {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    },
    {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    },
    {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    },
    {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    },
    {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    },
    {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    },
    {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    },
    {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    }, {
      "name": "Aashirvaad Shudh Chakki Atta, 1kg",
      "category": "Grocery items | Qty 1pcs",
      "price": "₹42",
    },


  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  Get.to(() => const ProfileScreen());
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color(0xFF00A86B),
                  size: 24,
                ),
              ),
            ),
          ),
          title: Text(
            "My Orders",
            style: TextStyle(
              fontSize: 26.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'Active'),
                Tab(text: 'Completed'),
                Tab(text: 'Cancelled'),
              ],
            ),

            Expanded(
              child: TabBarView(
                children: [
                  OrdersListView(
                    //Active Tabs
                      orders: activeOrders,
                      emptyText: "No Active orders"),

                  //Completed Orders
                  OrdersListView(
                      orders: completedOrders,
                      emptyText: 'No Competed Orders',
                  ),

                  //Cancelled Orders
                  OrdersListView(
                    orders: completedOrders,
                    emptyText: 'No Cancelled Orders',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
