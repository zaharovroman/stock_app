import '../../../domain/model/stock.dart';

abstract class StockRepository {
  Future<List<Stock>> getTop20Stocks();
}
