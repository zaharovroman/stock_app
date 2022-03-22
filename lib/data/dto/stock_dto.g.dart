// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockDTO _$StockDTOFromJson(Map<String, dynamic> json) => StockDTO(
      companyName: json['companyName'] as String,
      symbol: json['symbol'] as String,
      latestPrice: (json['latestPrice'] as num).toDouble(),
      change: (json['change'] as num).toDouble(),
      changePercent: (json['changePercent'] as num).toDouble(),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$StockDTOToJson(StockDTO instance) => <String, dynamic>{
      'companyName': instance.companyName,
      'symbol': instance.symbol,
      'latestPrice': instance.latestPrice,
      'change': instance.change,
      'changePercent': instance.changePercent,
      'currency': instance.currency,
    };
