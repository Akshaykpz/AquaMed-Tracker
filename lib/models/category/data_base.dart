import 'package:hive/hive.dart';
part 'data_base.g.dart';

@HiveType(typeId: 1)
class WaterModel extends HiveObject {
  @HiveField(0)
  final int water;
  @HiveField(1)
  final String subtitle;
  @HiveField(2)
  final DateTime time;
  @HiveField(3)
  final DateTime date;

  WaterModel(
      {
      // required this.complete,
      required this.date,
      required this.water,
      required this.subtitle,
      required this.time});
}

@HiveType(typeId: 2)
class WaterGoal extends HiveObject {
  @HiveField(0)
  late int goal;

  WaterGoal({required this.goal});

  static Box<WaterGoal> getdata() => Hive.box<WaterGoal>('goalbox');
}

@HiveType(typeId: 3)
class MedicineModel extends HiveObject {
  @HiveField(0)
  String pill;
  @HiveField(1)
  String note;
  @HiveField(2)
  String dose;
  @HiveField(3)
  String? iconbutton;
  @HiveField(4)
  bool onTap = false;
  @HiveField(5)
  String time;
  @HiveField(6)
  DateTime dates;
  MedicineModel(
      {required this.note,
      required this.dose,
      required this.pill,
      this.iconbutton,
      required this.dates,
      required this.time});
  static Box<MedicineModel> getData() => Hive.box('medines');
}

@HiveType(typeId: 4)
class MedicineCopyModel extends HiveObject {
  @HiveField(0)
  String pill;
  @HiveField(1)
  String date;
  @HiveField(2)
  String dose;
  @HiveField(3)
  String? iconbutton;
  @HiveField(4)
  bool onTap = false;

  MedicineCopyModel(
      {required this.date,
      required this.dose,
      required this.pill,
      this.iconbutton});
  static Box<MedicineCopyModel> getData() => Hive.box('medinescopy');
}

@HiveType(typeId: 5)
class ProgressValue extends HiveObject {
  @HiveField(0)
  final double progressvalues;
  ProgressValue({required this.progressvalues});
  static Box<ProgressValue> getData() => Hive.box('progressvalue');
}
