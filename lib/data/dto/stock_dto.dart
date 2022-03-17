import 'package:json_annotation/json_annotation.dart';
import 'package:stock_app/domain/model/stock.dart';

part 'stock_dto.g.dart';

@JsonSerializable()
class StockDTO {
  final String companyName;
  final String symbol;
  final double latestPrice;
  final double change;
  final double changePercent;
  final String currency;

  StockDTO({
    required this.companyName,
    required this.symbol,
    required this.latestPrice,
    required this.change,
    required this.changePercent,
    required this.currency,
  });

  factory StockDTO.fromJson(Map<String, dynamic> json) => _$StockDTOFromJson(json);

  Stock toModel() => Stock(
        name: companyName,
        symbol: symbol,
        value: latestPrice,
        change: change,
        changePercent: changePercent,
        currency: currency,
      );
}
