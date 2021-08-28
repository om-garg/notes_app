import 'package:flutter/material.dart';
import 'package:notes_app/model/notes_data.dart';
import 'package:notes_app/widgets/note_card.dart';
import 'package:provider/provider.dart';

class NotesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NotesData>(
      builder: (context, data, child) {
        return ListView.builder(
            itemCount: data.notesCount,
            itemBuilder: (context, index) {
              return NoteCard(
                title: data.note[index].title,
                description: data.note[index].desc,
                onPress: () {
                  data.deleteNotes(index);
                },
              );
            });
      },
    );
  }
}
