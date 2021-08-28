import 'dart:collection';

import 'package:flutter/material.dart';
import 'notes.dart';

class NotesData extends ChangeNotifier{
  List<Notes> _notes = [
    Notes(
        title: 'First Note',
        desc: "here are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on t",
    ),
  ];

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