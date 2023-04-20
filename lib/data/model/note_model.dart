import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class NoteModel {
  NoteModel({required this.note});
  @HiveField(0)
  String note;
}
