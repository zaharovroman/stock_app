import 'package:stock_app/data/dto/favourite_stock_dto.dart';

import '../../../domain/model/stock.dart';

abstract class FavouriteRepository {
  Future<void> addStock(Stock stock);
  Future<void> removeStock(Stock stock);
  Future<List<FavouriteStockDTO>> getAll();
  void addListener(Function() listener);
  void removeListener(Function() listener);
}
