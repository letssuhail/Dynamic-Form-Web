import 'package:flutter/material.dart';

Widget customTextField({
  required String? initialValue,
  required String? hintText,
  required void Function(String) onChanged,
}) {
  return TextFormField(
    initialValue: initialValue,
    decoration: InputDecoration(
      hintText: hintText,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: Colors.red, // Choose your error border color
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: Colors.grey,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: Colors.grey,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: Colors.grey,
        ),
      ),
    ),
    onChanged: onChanged,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter a value';
      }
      return null;
    },
  );
}
