import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_app/data/repository/stock_repository/stock_repository.dart';
import 'package:stock_app/presentation/home/home_model.dart';
import 'package:stock_app/presentation/home/home_screen.dart';

import '../../domain/model/stock.dart';

class HomeWM extends WidgetModel<HomeScreen, HomeModel> {
  HomeWM(HomeModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    model.loadStocks();
  }

  factory HomeWM.create(BuildContext context) {
    return HomeWM(
      HomeModel(
        context.read<StockRepository>(),
      ),
    );
  }

  ValueNotifier<List<Stock>> get stocks => model.stocks;
}
