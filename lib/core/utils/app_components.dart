import 'package:flutter/material.dart';

class AppComponents {
  static Widget unDefineRoute() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("data"),
      ),
    );
  }

 static Widget defaultFormField(
          {required TextEditingController controller,
          required String label,
          required Function validate,
          bool isPassword = false}) =>
      TextFormField(
        controller: controller,
        validator: (value) {
          validate(value);
        },
        obscureText: isPassword,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: label,
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(12))),
      );
}
