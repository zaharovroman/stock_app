import 'package:dio/dio.dart';
import 'package:stock_app/data/model/stock_dto.dart';

import 'package:stock_app/data/repository/stock_repository/stock_repository.dart';
import 'package:stock_app/domain/model/stock.dart';

class StockRepositoryService implements StockRepository {
  final _token = 'pk_0e64607a9fec4dd5a35f4d4e3e799e1c';
  final Dio _dio;

  StockRepositoryService(this._dio);
  @override
  Future<List<Stock>> getTop20Stocks() async {
    final response = await _dio.get<List>(
      '/stable/stock/market/list/gainers',
      queryParameters: {'token': _token},
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
}
