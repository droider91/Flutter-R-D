import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/data/impl/note_repository_impl/note_repo_impl.dart';
import 'package:flutter_boilerplate/domain/usecase/notes/get_note_list_case.dart';
import 'package:flutter_boilerplate/domain/usecase/notes/save_note_case.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String noteToSave = '';

  void saveData(String note) {
    //SaveNotesListUseCase(NoteRepositoryImpl()).call(ParamsSaveNote(note: note));
    GetNotesListUseCase(NoteRepositoryImpl()).call(Params(note: note));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              const SizedBox(
                  height: 48.0,
                  width: double.maxFinite,
                  child: ColoredBox(
                    color: Colors.teal,
                    child: Center(
                      child: Text(
                        'Create and save your todo',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 4.0),
                child: TextField(
                  maxLines: 4,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Enter your event',
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(fontSize: 18),
                  onChanged: (enteredText) {
                    noteToSave = enteredText;
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    print('the note is $noteToSave');
                    saveData(noteToSave);
                  },
                  child: Center(
                    widthFactor: MediaQuery.of(context).size.width * 3,
                    child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Save to database')),
                  )),
              //Flexible(child: ListView)
            ],
          ),
        ),
      ),
    );
  }
}
