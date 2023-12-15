// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maxsulot.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MaxsulotAdapter extends TypeAdapter<Maxsulot> {
  @override
  final int typeId = 0;

  @override
  Maxsulot read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Maxsulot(
      fields[0] as String,
      fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Maxsulot obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.nomi)
      ..writeByte(1)
      ..write(obj.soni);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MaxsulotAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
