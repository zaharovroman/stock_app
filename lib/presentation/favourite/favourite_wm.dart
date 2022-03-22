import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stock_app/data/dto/favourite_stock_dto.dart';
import 'package:stock_app/data/repository/boxes.dart';
import 'package:stock_app/data/repository/favourite_repository/favourite_repository.dart';
import 'package:stock_app/data/repository/stock_repository/stock_repository.dart';
import 'package:stock_app/presentation/favourite/favourite_model.dart';
import 'package:stock_app/presentation/favourite/favourite_screen.dart';

import '../../domain/model/stock.dart';

class FavouriteWM extends WidgetModel<FavouriteScreen, FavouriteModel> {
  FavouriteWM(FavouriteModel model) : super(model);

  final _favourite = EntityStateNotifier<List<Stock>>();

  factory FavouriteWM.create(BuildContext context) {
    return FavouriteWM(
      FavouriteModel(
        context.read<StockRepository>(),
        context.read<FavouriteRepository>(),
      ),
    );
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _loadFavourite();
    context.read<FavouriteRepository>().addListener(() => _loadFavourite());
  }

  @override
  void dispose() {
    super.dispose();
    context.read<FavouriteRepository>().removeListener(() async => await _loadFavourite());
  }

  Future<void> tapOnFavourite(Stock stock) async {
    if (model.favourite.any((element) => element.symbol == stock.symbol)) {
      await model.removeFromFavourite(stock);
    } else {
      await model.addToFavourite(stock);
    }
    _favourite.content(model.favourite);
  }

  Future<void> refresh() async {
    return _loadFavourite();
  }

  Future<void> _loadFavourite() async {
    final previousFavourite = _favourite.value?.data;
    _favourite.loading(previousFavourite);
    try {
      final res = await model.loadFavourite();
      _favourite.content(res);
    } on Exception catch (e) {
      _favourite.error(e, previousFavourite);
    }
  }

  ListenableState<EntityState<List<Stock>>> get favourite => _favourite;
}
