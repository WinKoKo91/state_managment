import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.label,
      required this.validator,
      required this.controller,
      this.hint,
      this.readOnly = false,
      this.suffixIcon,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.text})
      : super(key: key);

  final String label;
  final String? hint;
  final bool readOnly;
  final Widget? suffixIcon;
  final String? Function(String? value) validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        validator: validator,
        readOnly: readOnly,
        decoration: InputDecoration(
            labelText: label, hintText: hint, suffixIcon: suffixIcon),
        onSaved: (String? value) {
          // This optional block of code can be used to run
          // code when the user saves the form.
        },
      ),
    );
  }
}
