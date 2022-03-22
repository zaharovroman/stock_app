import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import 'package:stock_app/data/repository/stock_repository/stock_repository.dart';
import 'package:stock_app/domain/model/stock.dart';

class HomeModel extends ElementaryModel {
  final ValueNotifier<List<Stock>> _stocks = ValueNotifier([]);

  final StockRepository _stockRepository;

  HomeModel(
    this._stockRepository,
  );

  Future<List<Stock>> loadStocks() {
    return _stockRepository.getTop20Stocks();
  }

  ValueNotifier<List<Stock>> get stocks => _stocks;
}
