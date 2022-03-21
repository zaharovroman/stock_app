import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_app/data/repository/favourite_repository/favourite_repository.dart';
import 'package:stock_app/data/repository/stock_repository/stock_repository.dart';
import 'package:stock_app/presentation/favourite/favourite_model.dart';
import 'package:stock_app/presentation/home/home_model.dart';
import 'package:stock_app/presentation/home/home_screen.dart';

import '../../domain/model/stock.dart';

class HomeWM extends WidgetModel<HomeScreen, HomeModel> {
  HomeWM(HomeModel model, this._favouriteModel) : super(model);

  final _stocks = EntityStateNotifier<List<Stock>>();
  final _favourite = EntityStateNotifier<List<Stock>>(const EntityState(data: <Stock>[]));

  final FavouriteModel _favouriteModel;
  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadFavourite().then(
      (value) {
        _loadStocks();
      },
    );
  }

  factory HomeWM.create(BuildContext context) {
    final stockRepository = context.read<StockRepository>();
    final favouriteRepository = context.read<FavouriteRepository>();

    final favoutireModel = FavouriteModel(stockRepository, favouriteRepository);
    return HomeWM(
      HomeModel(
        stockRepository,
      ),
      favoutireModel,
    );
  }

  Future<void> _loadStocks() async {
    final previousStocks = _stocks.value?.data;
    _stocks.loading(previousStocks);
    try {
      final res = await model.loadStocks();
      _stocks.content(res);
    } on Exception catch (e) {
      _stocks.error(e, previousStocks);
    }
  }

  Future<void> _loadFavourite() async {
    final previousFavourite = _favourite.value?.data;
    _favourite.loading(previousFavourite);
    try {
      final res = await _favouriteModel.loadFavourite();
      _favourite.content(res);
    } on Exception catch (e) {
      _favourite.error(e, previousFavourite);
    }
  }

  Future<void> tapOnFavourite(Stock stock) async {
    if (_favouriteModel.favourite.any((element) => element.symbol == stock.symbol)) {
      await _favouriteModel.removeFromFavourite(stock);
    } else {
      await _favouriteModel.addToFavourite(stock);
    }
    _favourite.content(_favouriteModel.favourite);
  }

  ListenableState<EntityState<List<Stock>>> get stocks => _stocks;
  ListenableState<EntityState<List<Stock>>> get favourite => _favourite;
}
