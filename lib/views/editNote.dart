import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/note.dart';
import 'package:share_plus/share_plus.dart';

class EditNoteView extends StatefulWidget {
  List copy = [];
  List<Note> notes = [];
  Note note = new Note("content", "title", 0);
  EditNoteView(List<Note> notes, Note note) {
    this.notes = notes;
    this.note = note;
  }

  @override
  State<StatefulWidget> createState() {
    return _EditNoteViewState(notes, note);
  }
}

class _EditNoteViewState extends State {
  @override
  void initState() {
    super.initState();
    if (note == null) {
      titleController.text = '';
      contentController.text = '';
    } else {
      titleController.text = note.title;
      contentController.text = note.content;
    }
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  var checker_1 = false;
  var checker_2 = false;
  var note = Note.noInfo();
  int _currentColorIndex = 0;
  bool _firstJoin = false;
  var isDuplicate = false;
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
  var formKey = GlobalKey<FormState>();
  List<Note> notes = [];

  _EditNoteViewState(List<Note> notes, Note note) {
    this.notes = notes;
    this.note = note;
  }

  void _setColorIndex(index) {
    setState(() {
      _currentColorIndex = index;
      _firstJoin = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_firstJoin) {
      _setColorIndex(note.typeId);
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Note"),
          backgroundColor: Colors.blueGrey,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.more_vert_rounded,
                size: 28,
              ),
              tooltip: 'More',
              onPressed: () {
                setState(() {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 256 + 75,
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                        ),
                        color: Colors.blueGrey,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                height: 75,
                                child: TextButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      minimumSize:
                                          const Size.fromHeight(100), // NEW
                                      shape: BeveledRectangleBorder()),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 55,
                                        height: 55,
                                        margin: EdgeInsets.only(right: 20.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 45,
                                          child: Icon(
                                            Icons.share,
                                            color: Colors.black,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        "Share with your friends",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    Share.share(note.content);
                                  },
                                ),
                              ),
                              Container(
                                height: 75,
                                child: TextButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      minimumSize:
                                          const Size.fromHeight(100), // NEW
                                      shape: BeveledRectangleBorder()),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 55,
                                        height: 55,
                                        margin: EdgeInsets.only(right: 20.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 45,
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.black,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        "Delete",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    formKey.currentState?.save();
                                    setState(() {
                                      // notes.removeWhere(
                                      //     (item) => item.id == note.id);
                                      notes.remove(note);
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Your note successfully deleted.')));
                                    Timer(
                                        const Duration(milliseconds: 750),
                                        () => {
                                              Navigator.pop(context),
                                              Navigator.pop(context)
                                            });
                                  },
                                ),
                              ),
                              Container(
                                height: 75,
                                // padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      minimumSize:
                                          const Size.fromHeight(100), // NEW
                                      shape: BeveledRectangleBorder()),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 55,
                                        height: 55,
                                        margin: EdgeInsets.only(right: 20.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor: isDuplicate
                                              ? Colors.black
                                              : Colors.white,
                                          radius: 45,
                                          child: Icon(
                                            Icons.control_point_duplicate,
                                            color: isDuplicate
                                                ? Colors.white
                                                : Colors.black,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Duplicate",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isDuplicate = !isDuplicate;
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                    typesOfNotes.length,
                                    (index) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 50,
                                        width:
                                            100, // adjust the width as per your requirement
                                        color: Colors.transparent,
                                        child: Center(
                                            child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: typesOfNotes[index]
                                                [index.toInt() + 1],
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              // add your onTap logic here
                                              _setColorIndex(index);
                                              Navigator.pop(context);
                                            },
                                            child: StatefulBuilder(
                                              builder: (context, setState) {
                                                return _currentColorIndex ==
                                                        index
                                                    ? const Icon(
                                                        Icons.check,
                                                        color: Colors.black,
                                                      )
                                                    : const SizedBox();
                                              },
                                            ),
                                          ),
                                        )),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.check),
              tooltip: 'Update note',
              onPressed: () {
                if (checker_1 && checker_2) {
                  formKey.currentState?.save();
                  note.typeId = _currentColorIndex;
                  note.title = titleController.text;
                  note.content = contentController.text;
                  print(note.content);
                  if (isDuplicate) {
                    Note copiedNote = Note(
                      titleController.text,
                      contentController.text,
                      _currentColorIndex,
                    );
                    notes.add(copiedNote);
                  }
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Your note successfully updated.')));
                  Timer(const Duration(milliseconds: 750),
                      () => Navigator.pop(context));
                } else {
                  print(note.content);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Your note could not be edited.')));
                }
              },
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
              child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        autovalidateMode: AutovalidateMode.always,
                        controller: titleController,
                        validator: (inputValue) {
                          if (inputValue!.isEmpty) {
                            checker_1 = false;
                            return 'This field cannot be empty!';
                          }
                          checker_1 = true;
                          return null;
                        },
                        cursorColor: returnColor(_currentColorIndex),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: returnColor(_currentColorIndex),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: returnColor(_currentColorIndex),
                            ),
                          ),
                          labelStyle:
                              TextStyle(color: returnColor(_currentColorIndex)),
                          labelText: "Title of Note",
                          hintText: "Title",
                        ),
                      ),
                      TextFormField(
                        controller: contentController,
                        autovalidateMode: AutovalidateMode.always,
                        validator: (inputValue) {
                          if (inputValue!.isEmpty) {
                            checker_2 = false;
                            return 'This field cannot be empty!';
                          }
                          checker_2 = true;
                          return null;
                        },
                        cursorColor: returnColor(_currentColorIndex),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: returnColor(_currentColorIndex),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: returnColor(_currentColorIndex),
                            ),
                          ),
                          labelStyle:
                              TextStyle(color: returnColor(_currentColorIndex)),
                          labelText: "Content of Note",
                          hintText: "Content",
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ));
  }
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
