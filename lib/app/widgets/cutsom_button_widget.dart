import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  CustomButtonWidget(
      {Key? key, required this.label, this.onPressed, this.bgColor})
      : super(key: key);

  String label;
  VoidCallback? onPressed;
  Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
        style: ElevatedButton.styleFrom(
            primary: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            minimumSize: const Size(100, 48)),
      ),
    );
  }
}
