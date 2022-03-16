import 'package:flutter/material.dart';

import '../../domain/model/stock.dart';

class StockCard extends StatelessWidget {
  const StockCard({
    required this.stock,
    Key? key,
  }) : super(key: key);

  final Stock stock;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  stock.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                stock.symbol,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  '${stock.value.toString()} ${stock.currency}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                '${stock.change} ${stock.currency} (${stock.changePercent}%)',
                style: TextStyle(
                  color: stock.changePercent > 0 ? Colors.green : Colors.red,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
