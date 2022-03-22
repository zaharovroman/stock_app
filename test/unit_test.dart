import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stock_app/data/dto/favourite_stock_dto.dart';
import 'package:stock_app/data/repository/favourite_repository/favourite_repository.dart';
import 'package:stock_app/data/repository/stock_repository/stock_repository.dart';
import 'package:stock_app/domain/model/stock.dart';
import 'package:stock_app/presentation/favourite/favourite_model.dart';
import 'package:stock_app/presentation/favourite/favourite_wm.dart';
import 'package:stock_app/presentation/home/home_model.dart';

import 'unit_test.mocks.dart';

@GenerateMocks([StockRepository, FavouriteRepository])
void main() {
  final testStocks = [
    Stock(
      name: 'Amazon.com',
      symbol: 'AMZN',
      value: 3216,
      change: 321,
      changePercent: 10,
      currency: 'USD',
    ),
    Stock(
      name: 'AMD',
      symbol: 'AMD',
      value: 114,
      change: 5,
      changePercent: 4,
      currency: 'USD',
    ),
  ];

  final favouriteDTOList = <FavouriteStockDTO>[];
  final stockMock = MockStockRepository();
  final favouriteMock = MockFavouriteRepository();

  when(stockMock.getTop20Stocks()).thenAnswer(
    (_) => Future.value(testStocks),
  );

  when(favouriteMock.getAll()).thenAnswer((_) => Future.value(favouriteDTOList));
  for (var element in testStocks) {
    when(favouriteMock.addStock(element)).thenAnswer(
      (realInvocation) async => favouriteDTOList.add(
        FavouriteStockDTO(symbol: element.symbol),
      ),
    );
    when(favouriteMock.removeStock(element)).thenAnswer(
      (realInvocation) async => favouriteDTOList.remove(
        FavouriteStockDTO(symbol: element.symbol),
      ),
    );
    when(stockMock.getBySymbol(element.symbol)).thenAnswer((_) => Future.value(element));
  }
  group(
    'FavouriteModel test',
    () {
      test(
        'Get all favourite',
        () async {
          final model = FavouriteModel(stockMock, favouriteMock);

          expect(await model.loadFavourite(), []);
          for (var element in testStocks) {
            model.addToFavourite(element);
          }
          final favouriteList = await model.loadFavourite();
          expect(favouriteList.length, testStocks.length);
          for (var element in testStocks) {
            expect(favouriteList.contains(element), true);
          }
        },
      );
      test(
        'Add stock to favotourite',
        () async {
          final model = FavouriteModel(stockMock, favouriteMock);
          expect(model.favourite.contains(testStocks.first), false);
          await model.addToFavourite(testStocks.first);
          expect(model.favourite.contains(testStocks.first), true);
        },
      );
      test(
        'Remove stock from favotourite',
        () async {
          final model = FavouriteModel(stockMock, favouriteMock);
          await model.addToFavourite(testStocks.first);
          expect(model.favourite.contains(testStocks.first), true);
          await model.removeFromFavourite(testStocks.first);
          expect(model.favourite.contains(testStocks.first), false);
        },
      );
    },
  );

  group(
    'HomeModel tests',
    () {
      test(
        'Load stocks',
        () async {
          final model = HomeModel(stockMock);
          final stocks = await model.loadStocks();
          for (var element in stocks) {
            expect(testStocks.contains(element), true);
          }
        },
      );
    },
  );

  group(
    'FavouriteWM tests',
    () {
      test(
        'description',
        () async {
          final wm = FavouriteWM(
            FavouriteModel(stockMock, favouriteMock),
          );
        },
      );
    },
  );
}
