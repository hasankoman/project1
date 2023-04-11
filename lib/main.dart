import 'package:flutter/material.dart';
import 'package:flutter_application_1/NoteView.dart';
import 'package:flutter_application_1/models/note.dart';
import 'package:flutter_application_1/views/addNewNote.dart';

void main() {
  runApp(MaterialApp(
    home: MyNotes(),
  ));
}

class MyNotes extends StatefulWidget {
  const MyNotes({super.key});

  @override
  State<MyNotes> createState() => _MyNotesState();
}

class _MyNotesState extends State<MyNotes> {
  List<Note> myNotes = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Custom Widget",
      home: Center(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/welcome.png',
                      width: 200,
                    ),
                    SizedBox(
                      height: 200,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NoteView(myNotes)));
                        },
                        child: Text('Get Started'),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            primary: Colors.blueGrey,
                            padding: EdgeInsets.symmetric(vertical: 20.0)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
