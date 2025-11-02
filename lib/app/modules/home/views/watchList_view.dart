import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treding/app/modules/home/controllers/home_controller.dart';
import '../widgets/stock_list_tile.dart';

class WatchListView extends GetView<HomeController> {
  const WatchListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> stockData = [
      {"name": "RELIANCE", "exchange": "NSE", "price": "2,820.75", "change": "+12.30 (0.44%)"},
      {"name": "TCS", "exchange": "BSE", "price": "3,545.20", "change": "-22.15 (-0.62%)"},
      {"name": "INFY", "exchange": "NSE", "price": "1,563.10", "change": "+8.40 (0.54%)"},
      {"name": "HDFC BANK", "exchange": "BSE", "price": "1,582.00", "change": "-6.70 (-0.42%)"},
      {"name": "ICICI BANK", "exchange": "NSE", "price": "1,128.40", "change": "+3.90 (0.35%)"},
      {"name": "SBI", "exchange": "BSE", "price": "815.70", "change": "-4.25 (-0.52%)"},
    ];

    return GetBuilder(
      id: "WatchList",
      init: HomeController(),
      builder: (_) {
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
                        Text("NIFTY 50",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w600)),
                        Text("25,722.10  -155.75 (-0.60%)",
                            style: TextStyle(color: Colors.red, fontSize: 12)),
                      ],
                    ),
                    SizedBox(width: 18),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("NIFTY BANK",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w600)),
                        Text("57,776.35  +203.65 (+0.35%)",
                            style: TextStyle(color: Colors.green, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(Icons.shopping_cart_outlined,
                        color: Colors.black, size: 22),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 32,
                  color: Colors.black,
                ),
              ),
            ],
            bottom: TabBar(
              isScrollable: true,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              labelPadding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
              indicatorSize: TabBarIndicatorSize.label,
              tabAlignment: TabAlignment.start,
              onTap: (value) {
                controller.update(["WatchList"]);
              },
              controller: controller.watchListTabController,
              tabs:
                  controller.watchListTabs.map((e) => Tab(text: e)).toList(),
            ),
          ),

          // BODY
          body: TabBarView(
            controller: controller.watchListTabController,
            children: [
              // 🔹 Watchlist 1 - dynamic stock list
              Container(
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24))),
                child: Stack(
                  children: [
                    // Stock list
                    Container(
                      margin: const EdgeInsets.only(top: 70),
                      padding: const EdgeInsets.only(top: 8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(24)),
                      ),
                      child: ListView.separated(
                        itemCount: stockData.length,
                        separatorBuilder: (context, index) => const Divider(
                          height: 1,
                          thickness: 0.8,
                          color: Color(0xFFe0e0e0),
                          indent: 16,
                          endIndent: 16,
                        ),
                        itemBuilder: (context, index) {
                          final stock = stockData[index];
                          return StockListTile(
                            name: stock["name"]!,
                            exchange: stock["exchange"]!,
                            price: stock["price"]!,
                            change: stock["change"]!,
                          );
                        },
                      ),
                    ),

                    // 🔍 Stylish Search Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: controller.searchTEC,
                          onChanged: (value) {
                            controller.update(["Favorites"]);
                          },
                          decoration: InputDecoration(
                            hintText: 'Search & add',
                            border: InputBorder.none,
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 14),
                            prefixIcon:
                                const Icon(Icons.search, color: Colors.grey),
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "${6}/50",
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(
                                    height: 25, child: VerticalDivider()),
                                Icon(Icons.stacked_bar_chart,
                                    color: Colors.grey.withOpacity(0.8)),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // 🔹 Empty watchlists 2-5
              for (int i = 0; i < 4; i++)
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/gg.png',
                        width: 180,
                        height: 180,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Nothing here',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Use the search bar to add instruments to your watchlist',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
