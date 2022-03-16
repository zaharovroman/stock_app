class Stock {
  final String name;
  final String symbol;
  final double value;
  final double change;
  final double changePercent;
  final String currency;

  Stock({
    required this.name,
    required this.symbol,
    required this.value,
    required this.change,
    required this.changePercent,
    required this.currency,
  });
}
