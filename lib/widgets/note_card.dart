import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final String description;

  NoteCard({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.lightBlue,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            description,
            style: TextStyle(
              color: Colors.lightBlue,
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
