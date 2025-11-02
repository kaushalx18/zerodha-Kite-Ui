import 'package:flutter/material.dart';

class StockListTile extends StatelessWidget {
  final String name;
  final String exchange;
  final String price;
  final String change;

  const StockListTile({
    super.key,
    required this.name,
    required this.exchange,
    required this.price,
    required this.change,
  });

  @override
  Widget build(BuildContext context) {
    final isNegative = change.startsWith('-');
    final changeColor = isNegative ? Colors.red : Colors.green;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 2),
          Text(
            exchange,
            style: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            price,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(
            change,
            style: TextStyle(color: changeColor, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
