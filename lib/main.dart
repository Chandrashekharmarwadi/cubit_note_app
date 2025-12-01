import 'package:cubit_note_app/database/cubit_database.dart';
import 'package:cubit_note_app/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/notes_cubit.dart';

void main() {
  runApp(Note_App());
}

class Note_App extends StatefulWidget {
  const Note_App({super.key});

  @override
  State<Note_App> createState() => _Note_AppState();
}

class _Note_AppState extends State<Note_App> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=>NoteCubit(dbHelper: DbHelper.db),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Note App Using Cubit',
        home: HomeScreen(),
      ),
    );
  }
}
