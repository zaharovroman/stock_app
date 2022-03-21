import 'package:dio/dio.dart';

import 'package:stock_app/data/repository/stock_repository/stock_repository.dart';
import 'package:stock_app/data/repository/stock_repository/stock_service_options.dart';
import 'package:stock_app/domain/model/stock.dart';

import '../../dto/stock_dto.dart';

class StockRepositoryService implements StockRepository {
  final Dio _dio;

  StockRepositoryService(this._dio);

  @override
  Future<List<Stock>> getTop20Stocks() async {
    final response = await _dio.get<List>(
      StockServiceOptions.gainersListPath,
      queryParameters: {'token': StockServiceOptions.token},
    );
    if (response.data != null) {
      final stocks = response.data!.map((e) {
        return StockDTO.fromJson(e).toModel();
      }).toList();
      return stocks;
    } else {
      return [];
    }
  }

  @override
  Future<Stock> getBySymbol(String symbol) async {
    final response = await _dio.get(
      StockServiceOptions.getBySymbolPath(symbol),
      queryParameters: {'token': StockServiceOptions.token},
    );
    return StockDTO.fromJson(response.data).toModel();
  }
}
