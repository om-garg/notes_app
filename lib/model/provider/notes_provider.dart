import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:notes_app/repository/notes_repository.dart';
import '../notes.dart';

class NotesProvider extends ChangeNotifier {
  List<Notes> _notes = [];

  String _searchQuery = '';

  String get searchQuery => _searchQuery;

  NotesProvider() {
    fetchNotes();
  }

  UnmodifiableListView<Notes> get note {
    return UnmodifiableListView(_notes);
  }

  int get notesCount {
    return _notes.length;
  }

  void setSearchQuery(String val) {
    _searchQuery = val;
    notifyListeners();
  }

  List<Notes> getFilteredNotes() {
    return _notes
        .where((element) =>
            element.title.toLowerCase().contains(_searchQuery.toLowerCase()) || element.content.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  void sortNotes(){
    _notes.sort((a, b) => b.dateAdded!.compareTo(a.dateAdded!));
  }

  void addNotes(Notes notes) {
    final note = Notes(
        title: notes.title,
        content: notes.content,
        id: notes.id,
        userid: notes.userid,
        dateAdded: notes.dateAdded);
    _notes.add(note);
    sortNotes();
    notifyListeners();
    NotesRepository.addNote(note);
  }

  void updateNotes(Notes note) {
    int indexOfNote =
        _notes.indexOf(_notes.firstWhere((element) => element.id == note.id));
    _notes[indexOfNote] = note;
    sortNotes();
    notifyListeners();
    NotesRepository.updateNote(note);
  }

  void deleteNotes(int index) {
    String id = _notes[index].id;
    _notes.remove(_notes[index]);
    notifyListeners();
    NotesRepository.deleteNote(id);
  }

  void fetchNotes() async {
    _notes = await NotesRepository.fetchNotes();
    sortNotes();
    notifyListeners();
  }
}
