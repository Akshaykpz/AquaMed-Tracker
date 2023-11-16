import 'package:hive/hive.dart';
import 'package:ihydrate_application/models/category/data_base.dart';

class Boxes {
  static Box<WaterModel> getdata() => Hive.box<WaterModel>('category');
}
