import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:stock_app/data/repository/stock_repository/stock_repository.dart';
import 'package:stock_app/domain/model/stock.dart';

class HomeModel extends ElementaryModel {
  final ValueNotifier<List<Stock>> _stocks = ValueNotifier([]);
  final StockRepository _repository;

  HomeModel(this._repository);

  void loadStocks() {
    _repository.getTop20Stocks().then((value) {
      return _stocks.value = value;
    });
  }

  ValueNotifier<List<Stock>> get stocks => _stocks;
}
