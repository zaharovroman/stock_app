import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_app/data/repository/favourite_repository/favourite_repository.dart';
import 'package:stock_app/data/repository/stock_repository/stock_repository.dart';
import 'package:stock_app/presentation/favourite/favourite_model.dart';
import 'package:stock_app/presentation/favourite/favourite_screen.dart';

import '../../domain/model/stock.dart';

class FavouriteWM extends WidgetModel<FavouriteScreen, FavouriteModel> {
  FavouriteWM(FavouriteModel model) : super(model);

  factory FavouriteWM.create(BuildContext context) {
    return FavouriteWM(FavouriteModel(
      context.read<StockRepository>(),
      context.read<FavouriteRepository>(),
    ));
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    model.loadFavourite();
  }

  void tapOnFavourite(Stock stock) {
    if (favourite.value.any((element) => element.symbol == stock.symbol)) {
      model.removeFromFavourite(stock);
    } else {
      model.addToFavourite(stock);
    }
  }

  ValueNotifier<List<Stock>> get favourite => model.favourite;
}
