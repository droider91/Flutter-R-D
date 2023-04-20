import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import '../entity/note_entity.dart';

abstract class NoteRepository {
  Future<Either<Error, List<NoteEntity>>> getSavedNotes();

  Future<Either<Error, bool>> saveNote(String notes);
}
