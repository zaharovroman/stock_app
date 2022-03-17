// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_stock_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavouriteStockDTOAdapter extends TypeAdapter<FavouriteStockDTO> {
  @override
  final int typeId = 0;

  @override
  FavouriteStockDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavouriteStockDTO(
      symbol: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavouriteStockDTO obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.symbol);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteStockDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
