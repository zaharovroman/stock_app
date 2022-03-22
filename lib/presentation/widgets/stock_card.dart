import 'package:flutter/material.dart';
import 'package:stock_app/presentation/style/app_colors.dart';

import '../../domain/model/stock.dart';
import '../style/fonts.dart';

class StockCard extends StatelessWidget {
  const StockCard({
    required this.stock,
    this.onFavouriteTaped,
    this.isFavourite = false,
    Key? key,
  }) : super(key: key);

  final Stock stock;
  final VoidCallback? onFavouriteTaped;
  final bool isFavourite;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      stock.name,
                      style: Fonts.stockTitle,
                      softWrap: true,
                    ),
                  ),
                  Text(
                    stock.symbol,
                    style: Fonts.stockSymbol,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: onFavouriteTaped,
                    icon: isFavourite
                        ? const Icon(
                            Icons.favorite,
                            color: AppColors.favouriteColor,
                          )
                        : const Icon(Icons.favorite_border),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      '${stock.value.toString()} ${stock.currency}',
                      style: Fonts.stockTitle,
                    ),
                  ),
                  Text(
                    '${stock.change} ${stock.currency} (${_changePercent}%)',
                    style: TextStyle(
                      color: stock.changePercent > 0 ? AppColors.stockUp : AppColors.stockDown,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String get _changePercent => (stock.changePercent * 100).toStringAsFixed(2);
}
