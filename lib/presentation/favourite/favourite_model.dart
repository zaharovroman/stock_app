import 'package:elementary/elementary.dart';
import 'package:flutter/widgets.dart';

import '../../data/repository/favourite_repository/favourite_repository.dart';
import '../../data/repository/stock_repository/stock_repository.dart';
import '../../domain/model/stock.dart';

class FavouriteModel extends ElementaryModel {
  final StockRepository _stockRepository;
  final FavouriteRepository _favouriteRepository;

  final ValueNotifier<List<Stock>> _favourite = ValueNotifier([]);

  FavouriteModel(this._stockRepository, this._favouriteRepository);

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

  ValueNotifier<List<Stock>> get favourite => _favourite;
}
