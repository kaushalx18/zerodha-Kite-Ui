
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:treding/app/modules/home/controllers/home_controller.dart';

import 'bids_action_view.dart';
import 'ipo_listview.dart';


class BidsView extends GetView<HomeController> {
  const BidsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        id: "BidsView",
        init: HomeController(),
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

              actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.keyboard_arrow_down_outlined, size: 32, color: Colors.black))],
              bottom: TabBar(
                isScrollable: true,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                indicatorSize: TabBarIndicatorSize.tab,
                // tabAlignment: TabAlignment.start,
                labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                onTap: (value) {
                  controller.update(["BidsView"]);
                },
                controller: controller.bidTabController,
                tabs: controller.bidsTabs.map((e) => Tab(text: e)).toList(),
              ),
            ),
            body: TabBarView(
              controller: controller.bidTabController,
              children: const [
                BidActionsView(),
                IpoView(),
                SecuritiesView(),
              ],
            ),
          );
        });
  }
}

class SecuritiesView extends StatelessWidget {
  const SecuritiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("No securities available for bidding",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),));
  }
}