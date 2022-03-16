import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stock_app/data/repository/stock_repository/stock_repository.dart';
import 'package:stock_app/data/repository/stock_repository/stock_repository_service.dart';

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
                baseUrl: 'https://cloud.iexapis.com',
              ),
            ),
          ),
        ),
      ],
      child: child,
    );
  }
}
