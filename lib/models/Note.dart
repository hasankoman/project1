class Note {
  int id = 0;
  String content = "";
  String title = "";
  int typeId = 0;

  Note.withId(this.id, this.content, this.title, this.typeId);

  Note(this.content, this.title, this.typeId);

  Note.noInfo();
}
