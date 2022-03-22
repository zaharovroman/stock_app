import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:stock_app/domain/model/stock.dart';
import 'package:stock_app/presentation/home/home_wm.dart';
import 'package:stock_app/presentation/widgets/stock_card.dart';

import '../widgets/error_screen.dart';
import '../widgets/loading_screen.dart';

class HomeScreen extends ElementaryWidget<HomeWM> {
  const HomeScreen({Key? key}) : super(HomeWM.create, key: key);

  @override
  Widget build(HomeWM wm) {
    return EntityStateNotifierBuilder<List<Stock>>(
      listenableEntityState: wm.stocks,
      errorBuilder: (_, __, ___) {
        return const ErrorScreen();
      },
      loadingBuilder: (context, stocks) {
        return const LoadingScreen();
      },
      builder: (context, stocks) {
        return EntityStateNotifierBuilder<List<Stock>>(
          listenableEntityState: wm.favourite,
          errorBuilder: (context, exception, data) => const ErrorScreen(),
          loadingBuilder: (context, data) => const LoadingScreen(),
          builder: (context, favourite) {
            return RefreshIndicator(
              onRefresh: () {
                return wm.refresh();
              },
              child: Stack(
                children: [
                  ListView.builder(
                    itemBuilder: (context, index) {
                      final stock = stocks![index];
                      return StockCard(
                        stock: stock,
                        onFavouriteTaped: () {
                          wm.tapOnFavourite(stock);
                        },
                        isFavourite: favourite!.any((element) => element.symbol == stock.symbol),
                      );
                    },
                    itemCount: stocks!.length,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
