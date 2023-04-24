import 'package:dartz/dartz.dart';

import '../../../core/basecase/base_usecase.dart';
import '../../../core/error/error.dart';
import '../../repository/notes/note_repository.dart';

class SaveNotesListUseCase implements BaseUseCase<bool, ParamsSaveNote> {
  late NoteRepository noteRepository;

  SaveNotesListUseCase(this.noteRepository);

  @override
  Future<Either<Errr, bool>> call(ParamsSaveNote params) async {
    print('SaveNotesListUseCase: $params');
    return await noteRepository.saveNote(params.note);
  }
}

class ParamsSaveNote {
  late String note;

  ParamsSaveNote({required this.note});
}
