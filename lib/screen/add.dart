import 'dart:developer';

import 'package:cubit_note_app/Widget/text_custom.dart';
import 'package:cubit_note_app/cubit/notes_cubit.dart';
import 'package:cubit_note_app/model/cubit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  addDataToDatabase(String title, String desc) async {
    if (title == "" && desc == "") {
      return log("Enter required Fields");
    } else {
      context.read<NoteCubit>().addData(Note_Model(title: title, desc: desc));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Data"), backgroundColor: Colors.red),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Custom_Text_Field(
              controller: titleController,
              text: "Enter the Title",
              toHide: true,
            ),
            Custom_Text_Field(
              controller: descController,
              text: "Enter the desc",
              toHide: true,
            ),
            ElevatedButton(
              onPressed: () {
                addDataToDatabase(
                  titleController.text.toString(),
                  descController.text.toString(),
                );
                Navigator.pop(context);
              },
              child: Text("Add Data"),
            ),
          ],
        ),
      ),
    );
  }
}
