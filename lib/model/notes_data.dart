import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:notes_app/repository/notes.dart';
import 'notes.dart';

class NotesData extends ChangeNotifier {
  List<Notes> _notes = [];

  NotesData(){
    fetchNotes();
  }

  UnmodifiableListView<Notes> get note {
    return UnmodifiableListView(_notes);
  }

  int get notesCount {
    return _notes.length;
  }

  void addNotes(Notes notes) {
    final note = Notes(
      title: notes.title,
      content: notes.content,
      id: notes.id,
      userid: notes.userid,
      dateAdded: notes.dateAdded
    );
    _notes.add(note);
    notifyListeners();
    NotesRepository.addNote(note);
  }

  void updateNotes(Notes note) {
    int indexOfNote = _notes.indexOf(_notes.firstWhere((element) => element.id == note.id));
    _notes[indexOfNote] = note;
    notifyListeners();
    NotesRepository.updateNote (note);
  }
  
  void deleteNotes(int index) {
    String id = _notes[index].id;
    _notes.remove(_notes[index]);
    notifyListeners();
    NotesRepository.deleteNote(id);
  }

  void fetchNotes() async {
    _notes = await NotesRepository.fetchNotes();
    notifyListeners();
  }
}
