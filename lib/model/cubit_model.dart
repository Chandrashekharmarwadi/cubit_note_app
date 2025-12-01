import 'package:cubit_note_app/database/cubit_database.dart';

class Note_Model {
  int? noteId;
  String title;
  String desc;
  Note_Model({this.noteId, required this.title, required this.desc});
  factory Note_Model.fromMap(Map<String, dynamic> map) {
    return Note_Model(
      title: map[DbHelper.Column_Title],
      desc: map[DbHelper.Column_Desc],
      noteId: map[DbHelper.Column_Id],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      DbHelper.Column_Id: noteId,
      DbHelper.Column_Title: title,
      DbHelper.Column_Desc: desc,
    };
  }
}
