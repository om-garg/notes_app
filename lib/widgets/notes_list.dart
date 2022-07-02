import 'package:flutter/material.dart';
import 'package:notes_app/model/notes_data.dart';
import 'package:notes_app/screens/add_notes_screen.dart';
import 'package:notes_app/widgets/note_card.dart';
import 'package:provider/provider.dart';

class NotesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NotesData>(
      builder: (context, data, child) {
        return data.notesCount > 0 ? ListView.builder(
            itemCount: data.notesCount,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddNoteScreen(
isUpdate: true,
                  note: data.note[index],
                ))),
                child: NoteCard(
                  title: data.note[index].title,
                  description: data.note[index].content,
                  onPress: () {
                    data.deleteNotes(index);
                  },
                ),
              );
            }) : Center(
          child: Text(
            "No notes yet...",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
        );
      },
    );
  }
}
