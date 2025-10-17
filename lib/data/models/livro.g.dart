// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'livro.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LivroAdapter extends TypeAdapter<Livro> {
  @override
  final int typeId = 1;

  @override
  Livro read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Livro(
      fields[0] as String,
      fields[1] as String,
      fields[2] as int,
      fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Livro obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.titulo)
      ..writeByte(1)
      ..write(obj.autor)
      ..writeByte(2)
      ..write(obj.anoPublicacao)
      ..writeByte(3)
      ..write(obj.editora);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LivroAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
