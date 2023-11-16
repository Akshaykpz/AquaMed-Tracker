// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_base.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WaterModelAdapter extends TypeAdapter<WaterModel> {
  @override
  final int typeId = 1;

  @override
  WaterModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WaterModel(
      date: fields[3] as DateTime,
      water: fields[0] as int,
      subtitle: fields[1] as String,
      time: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, WaterModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.water)
      ..writeByte(1)
      ..write(obj.subtitle)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WaterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WaterGoalAdapter extends TypeAdapter<WaterGoal> {
  @override
  final int typeId = 2;

  @override
  WaterGoal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WaterGoal(
      goal: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WaterGoal obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.goal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WaterGoalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MedicineModelAdapter extends TypeAdapter<MedicineModel> {
  @override
  final int typeId = 3;

  @override
  MedicineModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MedicineModel(
      note: fields[1] as String,
      dose: fields[2] as String,
      pill: fields[0] as String,
      iconbutton: fields[3] as String?,
      dates: fields[6] as DateTime,
      time: fields[5] as String,
    )..onTap = fields[4] as bool;
  }

  @override
  void write(BinaryWriter writer, MedicineModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.pill)
      ..writeByte(1)
      ..write(obj.note)
      ..writeByte(2)
      ..write(obj.dose)
      ..writeByte(3)
      ..write(obj.iconbutton)
      ..writeByte(4)
      ..write(obj.onTap)
      ..writeByte(5)
      ..write(obj.time)
      ..writeByte(6)
      ..write(obj.dates);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicineModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MedicineCopyModelAdapter extends TypeAdapter<MedicineCopyModel> {
  @override
  final int typeId = 4;

  @override
  MedicineCopyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MedicineCopyModel(
      date: fields[1] as String,
      dose: fields[2] as String,
      pill: fields[0] as String,
      iconbutton: fields[3] as String?,
    )..onTap = fields[4] as bool;
  }

  @override
  void write(BinaryWriter writer, MedicineCopyModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.pill)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.dose)
      ..writeByte(3)
      ..write(obj.iconbutton)
      ..writeByte(4)
      ..write(obj.onTap);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicineCopyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProgressValueAdapter extends TypeAdapter<ProgressValue> {
  @override
  final int typeId = 5;

  @override
  ProgressValue read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProgressValue(
      progressvalues: fields[0] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ProgressValue obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.progressvalues);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProgressValueAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
