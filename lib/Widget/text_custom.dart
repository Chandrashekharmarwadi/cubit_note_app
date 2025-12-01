import 'package:flutter/material.dart';

class Custom_Text_Field extends StatelessWidget {
  String text;
  TextEditingController controller;
  bool toHide;

  Custom_Text_Field({
    super.key,
    required this.controller,
    required this.text,
    required this.toHide,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: TextField(
        obscureText: false,
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
        ),
      ),
    );
  }
}
