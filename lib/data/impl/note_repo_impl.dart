import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/domain/entity/note_entity.dart';
import 'package:hive/hive.dart';

import '../../domain/repository/note_repository.dart';
class NoteRepositoryImpl implements NoteRepository {
  @override
  Future<Either<Error, List<NoteEntity>>> getSavedNotes() {
    // TODO: implement getSavedNotes
    throw UnimplementedError();
  }

  @override
  Future<Either<Error, bool>> saveNote(String notes) async {
    var path = Directory.current.path;
    Hive.init(path);
    var noteBox = await Hive.openBox('my_notes');
    noteBox.add(notes);
    print('NoteRepositoryImpl: $notes and database is: $noteBox');

    var savedList = Hive.box('my_notes');
    print("data list is: $savedList");

    return Right(true);
  }

}