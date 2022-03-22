import 'package:hive/hive.dart';

part 'favourite_stock_dto.g.dart';

@HiveType(typeId: 0)
class FavouriteStockDTO {
  @HiveField(0)
  final String symbol;

  FavouriteStockDTO({required this.symbol});
}
