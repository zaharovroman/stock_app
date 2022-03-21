import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:stock_app/app_provider.dart';
import 'package:stock_app/data/dto/favourite_stock_dto.dart';
import 'package:stock_app/data/repository/boxes.dart';
import 'package:stock_app/presentation/app/app.dart';

import 'data/repository/favourite_repository/favourite_repository_box.dart';

void main() async {
  await FavouriteRepositoryBox.init();
  runApp(
    const AppProvider(
      child: MyApp(),
    ),
  );
}
