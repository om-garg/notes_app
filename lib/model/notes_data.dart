import 'dart:collection';

import 'package:flutter/material.dart';
import 'notes.dart';

class NotesData extends ChangeNotifier{
  List<Notes> _notes = [];

  UnmodifiableListView<Notes> get note{
    return UnmodifiableListView(_notes);
  }

  int get notesCount{
    return _notes.length;
  }

  void addNotes(String title, String desc){
    final note = Notes(
        title: title,
      desc: desc,
    );
    _notes.add(note);
    notifyListeners();
  }
}