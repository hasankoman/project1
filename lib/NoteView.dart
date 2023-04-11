// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/note.dart';
import 'package:flutter_application_1/views/addNewNote.dart';
import 'package:flutter_application_1/views/editNote.dart';

class NoteView extends StatefulWidget {
  List<Note> notes = [];

  NoteView(List<Note> notes) {
    this.notes = notes;
  }

  @override
  State<NoteView> createState() => _NoteViewState(notes);
}

class _NoteViewState extends State<NoteView> {
  List<Note> notes = [];

  _NoteViewState(List<Note> notes) {
    this.notes = notes;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Custom Widget",
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: Text("MY Notes"),
          ),
          body: isEmpty(notes, () => {setState(() => {})}),
          backgroundColor: Colors.grey[100],
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddNewNote(notes)))
                  .then((value) => setState(() => {}));
            },
            backgroundColor: Colors.blueGrey,
            tooltip: "Add note",
            child: const Icon(
              Icons.add_rounded,
              size: 40.0,
            ),
          ),
        ));
    ;
  }

  returnColor(n) {
    var typesOfNotes = [
      {1: Color(0xFFE9EAEE)},
      {2: Color(0xFFF28B81)},
      {3: Color(0xFFF7BD02)},
      {4: Color(0xFFFBF476)},
      {5: Color(0xFFCDFF90)},
      {6: Color(0xFFA7FEEB)},
      {7: Color(0xFFCBF0F8)},
      {8: Color(0xFFAFCBFA)},
      {9: Color(0xFFD7AEFC)},
      {10: Color(0xFFFBCFE9)},
      {11: Color(0xFFE6C9A9)},
    ];
    return typesOfNotes[n][n + 1];
  }

  isEmpty(n, function) {
    if (n.length > 0) {
      return CustomScrollView(
        slivers: <Widget>[
          // SliverAppBar(
          //   title: Text("Sliver App Bar"),
          // ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              Note note = n[index];
              return Container(
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                height: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1), // shadow color
                      spreadRadius: 1, // how wide the shadow is
                      blurRadius: 5, // how spread out the shadow is
                      offset: Offset(
                          0, 3), // offset of the shadow from the container
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                    left: BorderSide(
                      color: returnColor(note.typeId),
                      width: 8.0,
                    ),
                  )),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add button click logic here
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EditNoteView(notes, note)))
                          .then((value) => function());
                      ;
                    },
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                    side: BorderSide.none))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          note.title,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.purple),
                        ),
                        Text(
                          note.content,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }, childCount: n.length),
          ),
        ],
      );
      ;
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: const <Widget>[
            Icon(
              Icons.content_paste_off_rounded,
              size: 150.0,
              color: Colors.blueGrey,
            ),
            SizedBox(height: 40),
            Text(
              'No notes :(',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20),
            Text(
              'You have no tasks to do',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      );
    }
  }
}
