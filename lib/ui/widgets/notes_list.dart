import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/notes.dart';
import '../../provider/notes_provider.dart';
import '../../ui/widgets/note_card.dart';
import '../screens/add_notes_screen.dart';


class NotesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NotesProvider>(builder: (context, data, child) {
      return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              onChanged: (val) {
                data.setSearchQuery(val);
              },
              style: TextStyle(
                color: Colors.white,
              ),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    )
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  )
                )
              ),
            ),
          ),
          data.notesCount > 0
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: data.getFilteredNotes().length,
                  itemBuilder: (context, index) {
                    Notes currentNote = data.getFilteredNotes()[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddNoteScreen(
                                    isUpdate: true,
                                    note: currentNote,
                                  ))),
                      child: NoteCard(
                        title: currentNote.title,
                        description: currentNote.content,
                        onPress: () {
                          data.deleteNotes(index);
                        },
                      ),
                    );
                  })
              : Center(
                  child: Text(
                    "No notes yet...",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
        ],
      );
    });
  }
}
