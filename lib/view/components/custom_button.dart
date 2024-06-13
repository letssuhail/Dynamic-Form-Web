import 'package:flutter/material.dart';

Widget customButton({
  required VoidCallback ontap,
  required String text,
  required Color color,
  required Color textColor,
  required Color borderColor,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      side: BorderSide(color: borderColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    onPressed: ontap,
    child: Text(
      text,
      style: TextStyle(
        color: textColor,
      ),
    ),
  );
}
