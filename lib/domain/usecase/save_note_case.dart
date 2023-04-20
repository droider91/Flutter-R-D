import 'package:dartz/dartz.dart';

import '../../core/basecase/base_usecase.dart';
import '../repository/note_repository.dart';

class SaveNotesListUseCase implements BaseUseCase<bool, Params> {
  late NoteRepository noteRepository;

  SaveNotesListUseCase(this.noteRepository);

  @override
  Future<Either<Error, bool>> call(Params params) async {
    print('SaveNotesListUseCase: $params');
    return await noteRepository.saveNote(params.note);
  }
}

class Params {
  late String note;

  Params({required this.note});
}
