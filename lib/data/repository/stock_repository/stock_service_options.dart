class StockServiceOptions {
  static const baseUrl = 'https://cloud.iexapis.com';
  static const token = 'pk_0e64607a9fec4dd5a35f4d4e3e799e1c';
  static const gainersListPath = '/stable/stock/market/list/gainers';
  static getBySymbolPath(String symbol) => '/stable/stock/$symbol/quote/';
}
