import 'dart:developer';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stock_app/domain/model/stock.dart';
import 'package:stock_app/presentation/home/home_model.dart';
import 'package:stock_app/presentation/home/home_wm.dart';
import 'package:stock_app/presentation/widgets/stock_card.dart';

class HomeScreen extends ElementaryWidget<HomeWM> {
  const HomeScreen({Key? key}) : super(HomeWM.create, key: key);

  @override
  Widget build(HomeWM wm) {
    return ValueListenableBuilder<List<Stock>>(
      valueListenable: wm.stocks,
      builder: (context, stocks, child) {
        log(stocks.toString());
        return ListView.builder(
          itemBuilder: (context, index) {
            final stock = stocks[index];
            return StockCard(stock: stock);
          },
          itemCount: stocks.length,
        );
      },
    );
  }
}
