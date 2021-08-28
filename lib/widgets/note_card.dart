import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final String description;
  final void Function()? onPress;
  NoteCard({
    required this.title,
    required this.description,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15.0),
      shadowColor: Colors.black38,
      elevation: 20,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: Colors.black38,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
