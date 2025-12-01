import 'dart:io';
import 'package:cubit_note_app/model/cubit_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper db = DbHelper();
  Database? _database;
  static final Column_Table = 'Note_Table';
  static final Column_Id = 'Note_Id';
  static final Column_Title = 'Note_Title';
  static final Column_Desc = 'Note_Desc';

  Future<Database> getDb() async {
    if (_database != null) {
      return _database!;
    } else {
      return await initDb();
    }
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    var dbPath = join(directory.path + 'notesdb.db');
    return openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        db.execute(
          "create table $Column_Table( $Column_Id integer primary key autoincrement, $Column_Title text, $Column_Desc text )",
        );
      },
    );
  }

  Future<bool> addData(Note_Model note_model) async {
    var db = await getDb();
    var check = await db.insert(Column_Table, note_model.toMap());
    return check > 0;
  }

  Future<List<Note_Model>> getNotes() async {
    var db = await getDb();
    List<Note_Model> noteList = [];
    var data = await db.query(Column_Table);
    for (Map<String, dynamic> eachData in data) {
      Note_Model note_model = Note_Model.fromMap(eachData);
      noteList.add(note_model);
    }
    return noteList;
  }

  Future<bool> updateData(Note_Model note_model) async {
    var db = await getDb();
    var check = await db.update(
      Column_Table,
      note_model.toMap(),
      where: "$Column_Id=${note_model.noteId}",
    );
    return check > 0;
  }

  Future<bool> deleteData(int id) async {
    var db = await getDb();
    var check = await db.delete(
      Column_Table,
      where: "$Column_Id=?",
      whereArgs: [id.toString()],
    );
    return check > 0;
  }
}
