import 'package:elementary/elementary.dart';

import 'package:stock_app/data/repository/stock_repository/stock_repository.dart';
import 'package:stock_app/domain/model/stock.dart';

class HomeModel extends ElementaryModel {
  final StockRepository _stockRepository;

  HomeModel(
    this._stockRepository,
  );

  Future<List<Stock>> loadStocks() {
    return _stockRepository.getTop20Stocks();
  }
}
