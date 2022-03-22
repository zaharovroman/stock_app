import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import 'package:stock_app/presentation/favourite/favourite_wm.dart';

import '../../domain/model/stock.dart';
import '../widgets/error_screen.dart';
import '../widgets/loading_screen.dart';
import '../widgets/stock_card.dart';

class FavouriteScreen extends ElementaryWidget<FavouriteWM> {
  const FavouriteScreen({Key? key})
      : super(
          FavouriteWM.create,
          key: key,
        );

  @override
  Widget build(FavouriteWM wm) {
    return EntityStateNotifierBuilder<List<Stock>>(
      listenableEntityState: wm.favourite,
      errorBuilder: (context, exception, data) => const ErrorScreen(),
      loadingBuilder: (context, data) => const LoadingScreen(),
      builder: (context, favourite) {
        return RefreshIndicator(
          onRefresh: () => wm.refresh(),
          child: Stack(
            children: [
              ListView.builder(
                itemBuilder: (context, index) {
                  final stock = favourite![index];
                  return StockCard(
                    stock: stock,
                    onFavouriteTaped: () {
                      wm.tapOnFavourite(stock);
                    },
                    isFavourite: favourite.any((element) => element.symbol == stock.symbol),
                  );
                },
                itemCount: favourite!.length,
              ),
            ],
          ),
        );
      },
    );
  }
}
