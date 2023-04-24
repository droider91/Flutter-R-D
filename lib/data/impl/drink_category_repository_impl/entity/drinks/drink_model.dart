import 'package:hive/hive.dart';
part 'drink_model.g.dart';

@HiveType(typeId: 1)
class DrinkEntity extends HiveObject {
  DrinkEntity({required this.strCategory});

  @HiveField(0)
  String strCategory;
}
