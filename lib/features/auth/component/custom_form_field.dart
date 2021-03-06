import 'package:flutter/material.dart';
import 'package:interview_app_medical/global_color.dart';

class CustomFormTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int maxLines;
  final Color enabledBordercolor;
  const CustomFormTextField(
      {Key? key,
      required this.controller,
      required this.label,
      this.maxLines = 1,
      this.enabledBordercolor = GlobalColor.buttonsColors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: enabledBordercolor),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter your $label';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
