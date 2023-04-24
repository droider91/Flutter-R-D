import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/domain/repository/notes/note_repository.dart';
import 'package:flutter_boilerplate/domain/usecase/notes/get_note_list_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNoteRepository extends Mock implements NoteRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late GetNotesListUseCase _getNotesListUseCase;
  late MockNoteRepository _mockNoteRepository;
  setUp(() {
    _mockNoteRepository = MockNoteRepository();
    _getNotesListUseCase = GetNotesListUseCase(_mockNoteRepository);
  });

  String note = "hello";
  bool response = true;

  test('should save note', () async {

    when(_mockNoteRepository.saveNote(notes: 'any'))
        .thenAnswer((_) async => Right(response));
    final result = await _getNotesListUseCase(Params(note: note));
    expect(result, Right(response));
    verify(_mockNoteRepository.saveNote(notes: note));
    verifyNoMoreInteractions(_mockNoteRepository);
  });
}
