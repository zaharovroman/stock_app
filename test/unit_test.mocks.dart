// Mocks generated by Mockito 5.1.0 from annotations
// in stock_app/test/unit_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:stock_app/data/dto/favourite_stock_dto.dart' as _i6;
import 'package:stock_app/data/repository/favourite_repository/favourite_repository.dart'
    as _i5;
import 'package:stock_app/data/repository/stock_repository/stock_repository.dart'
    as _i3;
import 'package:stock_app/domain/model/stock.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeStock_0 extends _i1.Fake implements _i2.Stock {}

/// A class which mocks [StockRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockStockRepository extends _i1.Mock implements _i3.StockRepository {
  MockStockRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i2.Stock>> getTop20Stocks() =>
      (super.noSuchMethod(Invocation.method(#getTop20Stocks, []),
              returnValue: Future<List<_i2.Stock>>.value(<_i2.Stock>[]))
          as _i4.Future<List<_i2.Stock>>);
  @override
  _i4.Future<_i2.Stock> getBySymbol(String? symbol) =>
      (super.noSuchMethod(Invocation.method(#getBySymbol, [symbol]),
              returnValue: Future<_i2.Stock>.value(_FakeStock_0()))
          as _i4.Future<_i2.Stock>);
}

/// A class which mocks [FavouriteRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockFavouriteRepository extends _i1.Mock
    implements _i5.FavouriteRepository {
  MockFavouriteRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<void> addStock(_i2.Stock? stock) =>
      (super.noSuchMethod(Invocation.method(#addStock, [stock]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> removeStock(_i2.Stock? stock) =>
      (super.noSuchMethod(Invocation.method(#removeStock, [stock]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<List<_i6.FavouriteStockDTO>> getAll() =>
      (super.noSuchMethod(Invocation.method(#getAll, []),
              returnValue: Future<List<_i6.FavouriteStockDTO>>.value(
                  <_i6.FavouriteStockDTO>[]))
          as _i4.Future<List<_i6.FavouriteStockDTO>>);
  @override
  void addListener(dynamic Function()? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(dynamic Function()? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
}
