import 'package:treding/app/file_provider.dart';
import 'package:treding/app/modules/home/views/position_view.dart';
import '../controllers/home_controller.dart';
import 'holdings_view.dart';

class PortfolioView extends GetView<HomeController> {
  const PortfolioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: "Portfolio",
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
                onTap: (value) {
                  controller.update(["Portfolio"]);
                },
                controller: controller.portfolioTabController,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                tabs: controller.portfolioTabs.map((e) => Tab(text: e)).toList(),
              ),
            ),
            body: TabBarView(
              controller: controller.portfolioTabController,
              children: const [
                HoldingsView(),
                PositionsView(),
              ],
            ),
          );
        });
  }
}

