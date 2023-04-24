import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/error/error.dart';
import '../../entity/note_entity.dart';

abstract class NoteRepository {
  Future<Either<Errr, List<NoteEntity>>> getSavedNotes();

  Future<Either<Errr, bool>> saveNote(String notes);
}
