import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:stock_app/data/repository/favourite_repository/favourite_repository.dart';
import 'package:stock_app/data/repository/stock_repository/stock_repository.dart';
import 'package:stock_app/domain/model/stock.dart';

class HomeModel extends ElementaryModel {
  final ValueNotifier<List<Stock>> _stocks = ValueNotifier([]);
  final ValueNotifier<List<Stock>> _favourite = ValueNotifier([]);
  final StockRepository _stockRepository;
  final FavouriteRepository _favouriteRepository;

  HomeModel(
    this._stockRepository,
    this._favouriteRepository,
  );

  void loadStocks() {
    _stockRepository.getTop20Stocks().then((value) {
      return _stocks.value = value;
    });
  }

  Future<void> loadFavourite() async {
    final favouritesDTO = await _favouriteRepository.getAll();
    final favourites = <Stock>[];
    for (var element in favouritesDTO) {
      final stock = await _stockRepository.getBySymbol(element.symbol);
      favourites.add(stock);
    }
    _favourite.value = favourites;
  }

  Future<void> addToFavourite(Stock stock) async {
    await _favouriteRepository.addStock(stock);
    return loadFavourite();
  }

  Future<void> removeFromFavourite(Stock stock) async {
    await _favouriteRepository.removeStock(stock);
    return loadFavourite();
  }

  ValueNotifier<List<Stock>> get stocks => _stocks;
  ValueNotifier<List<Stock>> get favourite => _favourite;
}
