import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key, required this.hintText, this.onChanged, this.prefixIcon , this.validator , this.controller});

  Function(String)? onChanged;
  String? Function(String?)? validator;
  String hintText;
  IconData? prefixIcon;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator
      ,
      obscureText: false,
      onChanged: (value) {},
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.white70,
              )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.white70,
            ),
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.black,
            size: 35,
          )),
    );
  }
}
