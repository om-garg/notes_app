import 'package:flutter/material.dart';
import 'package:notes_app/model/notes_data.dart';
import 'package:notes_app/widgets/note_card.dart';
import 'package:provider/provider.dart';

class NotesList extends StatelessWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesData>(
      builder: (context, data, builder){
        return ListView.builder(
          itemCount: data.notesCount,
            itemBuilder: (context, index){
            return NoteCard(
                title: data[index].t,
                description: description
            );
          }
        );
      },
    );
  }
}
