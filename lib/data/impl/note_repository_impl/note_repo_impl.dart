import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/data/model/notes/note_model.dart';
import 'package:flutter_boilerplate/domain/entity/note_entity.dart';
import 'package:hive/hive.dart';

import '../../../core/error/error.dart';
import '../../../domain/repository/notes/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  @override
  Future<Either<Errr, List<NoteEntity>>> getSavedNotes() async {
    var openedBox = await Hive.openBox<NoteModel>('my_notes');
    List _inventoryList = openedBox.values.toList();
    print('data list: $_inventoryList');

    for(var noteObj in _inventoryList) {
      if(noteObj is NoteModel) {
        print("note data is:${noteObj.note}");
      }
    }
    return Left(Errr(msg: 'errrr'));
  }

  @override
  Future<Either<Errr, bool>> saveNote(String notes) async {
    var noteBox = await Hive.openBox<NoteModel>('my_notes');
    noteBox.add(NoteModel(note: notes));
    print('NoteRepositoryImpl: $notes and database is: $noteBox');
    noteBox.close();
    return Right(true);
  }
}
