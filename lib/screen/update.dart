import 'dart:developer';

import 'package:cubit_note_app/Widget/text_custom.dart';
import 'package:cubit_note_app/cubit/notes_cubit.dart';
import 'package:cubit_note_app/model/cubit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateDateScreen extends StatefulWidget {
  int? noteUId;
  String title;
  String desc;

  UpdateDateScreen({
    super.key,
    this.noteUId,
    required this.title,
    required this.desc,
  });

  @override
  State<UpdateDateScreen> createState() => _UpdateDateScreenState();
}

class _UpdateDateScreenState extends State<UpdateDateScreen> {
  TextEditingController updateTitle = TextEditingController();
  TextEditingController updateDesc = TextEditingController();

  updateDataToDatabase(int? id, String title, String desc) async {
    if (title == '' && desc == '') {
      return log("Data Has Been Updated");
    } else {
      context.read<NoteCubit>().updateDataCubit(
        Note_Model(title: title, desc: desc, noteId: id),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    updateTitle.text = widget.title;
    updateDesc.text = widget.desc;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Update Data'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Custom_Text_Field(
              controller: updateTitle,
              text: updateTitle.text,
              toHide: true,
            ),
            Custom_Text_Field(
              controller: updateDesc,
              text: updateDesc.text,
              toHide: true,
            ),
            ElevatedButton(
              onPressed: () {
                updateDataToDatabase(
                  widget.noteUId,
                  updateTitle.text.toString(),
                  updateDesc.text.toString(),
                );
                Navigator.pop(context);
              },
              child: Text("Update Data"),
            ),
          ],
        ),
      ),
    );
  }
}
