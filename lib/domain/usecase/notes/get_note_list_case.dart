import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/basecase/base_usecase.dart';

import '../../../core/error/error.dart';
import '../../entity/note_entity.dart';
import '../../repository/notes/note_repository.dart';

class GetNotesListUseCase implements BaseUseCase<List<NoteEntity>, Params> {
  late NoteRepository noteRepository;

  GetNotesListUseCase(this.noteRepository);

  @override
  Future<Either<Errr, List<NoteEntity>>> call(Params param) async {
    return await noteRepository.getSavedNotes();
  }
}

class Params {
 String note;
  Params({required this.note});
}
