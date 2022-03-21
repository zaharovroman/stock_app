import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:stock_app/data/repository/boxes.dart';
import 'package:stock_app/data/repository/favourite_repository/favourite_repository.dart';
import 'package:stock_app/data/repository/favourite_repository/favourite_repository_box.dart';
import 'package:stock_app/data/repository/stock_repository/stock_repository.dart';
import 'package:stock_app/data/repository/stock_repository/stock_repository_service.dart';
import 'package:stock_app/data/repository/stock_repository/stock_service_options.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<StockRepository>(
          create: (context) => StockRepositoryService(
            Dio(
              BaseOptions(
                baseUrl: StockServiceOptions.baseUrl,
              ),
            ),
          ),
        ),
        Provider<FavouriteRepository>(
          create: (context) {
            return FavouriteRepositoryBox(
              Hive.box(Boxes.favourite),
            );
          },
        ),
      ],
      child: child,
    );
  }
}
