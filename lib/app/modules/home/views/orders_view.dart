import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:treding/app/modules/home/controllers/home_controller.dart';

import '../widgets/order_stock_list_tile.dart';

class OrdersView extends GetView<HomeController> {
  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: "OrderList",
        builder: (con) {
          return Scaffold(
            backgroundColor: const Color(0xFFebebed),
            appBar: AppBar(
              backgroundColor: const Color(0xFFebebed),
              title: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "NIFTY 50",
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "25,722.10  -155.75 (-0.60%)",
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ],
        ),
        SizedBox(width: 18),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "NIFTY BANK",
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "57,776.35  +203.65 (+0.35%)",
              style: TextStyle(
                color: Colors.green,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    ),
    Row(
      children: const [
        Icon(Icons.shopping_cart_outlined, color: Colors.black, size: 22),
        SizedBox(width: 10),
        
      ],
    ),
  ],
),

              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_down_outlined,
                        size: 32, color: Colors.black))
              ],
              bottom: TabBar(
                isScrollable: true,
                onTap: (value) {
                  controller.update(["OrderList"]);
                },
                controller: controller.ordersTabController,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                indicatorSize: TabBarIndicatorSize.tab,
                tabAlignment: TabAlignment.start,
                tabs: controller.ordersTabs.map((e) => Tab(text: e)).toList(),
              ),
            ),
            body: TabBarView(
              controller: controller.ordersTabController,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24))),
                  child: ListView.builder(
                    itemCount: 50,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        // Row for search and filter icons at the first index
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 16,
                                ),
                                IconButton(
                                  icon: const Icon(Icons.search),
                                  onPressed: () {},
                                  visualDensity: const VisualDensity(
                                      horizontal: -4, vertical: -2),
                                ),
                                // Filter icon
                                IconButton(
                                  icon: const Icon(Icons.filter_list),
                                  onPressed: () {},
                                  visualDensity: const VisualDensity(
                                      horizontal: -4, vertical: -2),
                                ),
                              ],
                            ),
                            const Divider(
                              height: 0,
                              color: Colors.grey,
                              thickness: 0.3,
                            )
                          ],
                        );
                      } else {
                        return const OrderStockListTile();
                      }
                    },
                  ),
                ),
                Center(
                  child: Text(
                    controller.ordersTabs[controller.ordersTabController.index],
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Center(
                  child: Text(
                    controller.ordersTabs[controller.ordersTabController.index],
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Center(
                  child: Text(
                    controller.ordersTabs[controller.ordersTabController.index],
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Center(
                  child: Text(
                    controller.ordersTabs[controller.ordersTabController.index],
                    style: const TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          );
        });
  }
}
