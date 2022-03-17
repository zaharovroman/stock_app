import 'package:hive/hive.dart';
import 'package:stock_app/data/dto/favourite_stock_dto.dart';
import 'package:stock_app/data/repository/favourite_repository/favourite_repository.dart';
import 'package:stock_app/domain/model/stock.dart';

class FavouriteRepositoryBox implements FavouriteRepository {
  final Box<FavouriteStockDTO> _box;

  FavouriteRepositoryBox(this._box);
  @override
  Future<void> addStock(Stock stock) {
    final dto = FavouriteStockDTO(symbol: stock.symbol);
    return _box.put(dto.symbol, dto);
  }

  @override
  Future<List<FavouriteStockDTO>> getAll() {
    return Future.value(
      _box.values.toList(),
    );
  }

  @override
  Future<void> removeStock(Stock stock) async {
    return _box.delete(stock.symbol);
  }
}
