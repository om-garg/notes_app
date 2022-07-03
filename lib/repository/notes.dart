import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';

import '../model/notes.dart';
import 'package:http/http.dart' as http;

class NotesRepository {
  static final String url = "https://secure-sierra-64918.herokuapp.com/note";

  static Future<void> addNote(Notes note) async {
    Response response = await http.post(Uri.parse(url), body: note.toMap());
    var decoded = jsonDecode(response.body);
    print(note.toMap());
    log(decoded.toString());
  }

  static Future<void> deleteNote(String id) async {
    Response response = await http.delete(Uri.parse(url+"/$id"));
    var decoded = jsonDecode(response.body);
    log(decoded.toString());
  }

  static Future<void> updateNote(Notes note) async {
    Response response = await http.patch(Uri.parse(url+"/${note.id}"), body: note.toMap());
    var decoded = jsonDecode(response.body);
    log(decoded.toString());
  }

  static Future<List<Notes>> fetchNotes() async {
    Response response = await http.get(Uri.parse(url));
    var decoded = jsonDecode(response.body);
    log(decoded.toString());

    List<Notes> notes = [];
    for(var noteMap in decoded) {
      Notes newNote = Notes.fromMap(noteMap);
      notes.add(newNote);
    }

    return notes;
  }
}