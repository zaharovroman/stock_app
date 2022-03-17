import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import 'package:stock_app/presentation/favourite/favourite_wm.dart';

import '../../domain/model/stock.dart';
import '../widgets/stock_card.dart';

class FavouriteScreen extends ElementaryWidget<FavouriteWM> {
  const FavouriteScreen({Key? key})
      : super(
          FavouriteWM.create,
          key: key,
        );

  @override
  Widget build(FavouriteWM wm) {
    return ValueListenableBuilder<List<Stock>>(
      valueListenable: wm.favourite,
      builder: (context, favourite, child) {
        return Stack(
          children: [
            ListView.builder(
              itemBuilder: (context, index) {
                final stock = favourite[index];
                return StockCard(
                  stock: stock,
                  onFavouriteTaped: () {
                    wm.tapOnFavourite(stock);
                  },
                  isFavourite: favourite.any((element) => element.symbol == stock.symbol),
                );
              },
              itemCount: favourite.length,
            ),
          ],
        );
      },
    );
  }
}
