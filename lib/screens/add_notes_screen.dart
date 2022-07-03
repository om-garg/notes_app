import 'package:flutter/material.dart';
import 'package:notes_app/model/notes_data.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../model/notes.dart';

class AddNoteScreen extends StatefulWidget {
  final bool isUpdate;
  final Notes? note;
  AddNoteScreen({
    this.note,
    required this.isUpdate,
  });
  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  FocusNode noteFocus = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.isUpdate) {
      title.text = widget.note!.title;
      content.text = widget.note!.content;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    title.dispose();
    content.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onSubmitted: (val) {
                if (val != " ") {
                  noteFocus.requestFocus();
                }
              },
              controller: title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.w600,
              ),
              keyboardType: TextInputType.text,
              cursorColor: Colors.white,
              cursorHeight: 27,
              decoration: InputDecoration(
                hintText: 'Title of Note',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
                border: InputBorder.none,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: TextField(
                focusNode: noteFocus,
                controller: content,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                keyboardType: TextInputType.text,
                cursorColor: Colors.white,
                cursorHeight: 25,
                maxLines: 22,
                decoration: InputDecoration(
                  hintText: 'Description',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.5,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.5,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              text: widget.isUpdate ? "Edit" : 'Add',
              onPress: () {
                if (widget.isUpdate) {
                  Notes note = new Notes(
                    id: widget.note!.id,
                    userid: widget.note!.userid,
                    title: title.text,
                    content: content.text,
                    dateAdded: DateTime.now(),
                  );
                  Provider.of<NotesData>(context, listen: false)
                      .updateNotes(note);
                  Navigator.pop(context);
                } else {
                  Notes note = new Notes(
                    id: Uuid().v1(),
                    userid: "gargom52@gmail.com",
                    title: title.text,
                    content: content.text,
                    dateAdded: DateTime.now(),
                  );
                  print(note.id);
                  Provider.of<NotesData>(context, listen: false).addNotes(note);
                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
      ),
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: Text(
          'Flutter Notes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
