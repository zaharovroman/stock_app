import 'dart:developer';

import 'package:elementary/elementary.dart';
import 'package:flutter/widgets.dart';

import '../../data/repository/favourite_repository/favourite_repository.dart';
import '../../data/repository/stock_repository/stock_repository.dart';
import '../../domain/model/stock.dart';

class FavouriteModel extends ElementaryModel {
  final StockRepository _stockRepository;
  final FavouriteRepository _favouriteRepository;

  final List<Stock> _favourite = [];

  FavouriteModel(this._stockRepository, this._favouriteRepository);

  Future<List<Stock>> loadFavourite() async {
    final favouritesDTO = await _favouriteRepository.getAll();
    final favourites = <Stock>[];
    for (var element in favouritesDTO) {
      final stock = await _stockRepository.getBySymbol(element.symbol);
      favourites.add(stock);
    }
    _favourite.clear();
    _favourite.addAll(favourites);
    return favourites;
  }

  Future<void> addToFavourite(Stock stock) async {
    _favourite.add(stock);
    _favouriteRepository.addStock(stock);
  }

  Future<void> removeFromFavourite(Stock stock) async {
    _favourite.removeWhere((element) => element.symbol == stock.symbol);
    _favouriteRepository.removeStock(stock);
  }

  List<Stock> get favourite => _favourite;
}
