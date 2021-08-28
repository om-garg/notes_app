import 'package:flutter/material.dart';
import 'package:notes_app/model/notes_data.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String titleText = '';
    String descText = '';
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
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
              onChanged: (value) {
                titleText = value;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: TextField(
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
                onChanged: (value) {
                  descText = value;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                print(titleText);
                print(descText);
                Provider.of<NotesData>(context, listen: false)
                    .addNotes(titleText, descText);
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.06,
                color: Colors.white,
                child: Center(
                  child: Text(
                    'Add',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
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
