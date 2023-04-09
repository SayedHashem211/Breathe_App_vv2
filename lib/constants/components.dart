// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';



void navigateAndFinish(Widget, context) => Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, _) {
          return FadeTransition(
            opacity: animation,
            child: Widget,
          );
        },
      ),
      (route) => false,
    );

String token = '';



Widget defaultFormField({
  required TextEditingController? controller,
  required TextInputType? type,
  TextInputAction? action,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isPassword = false,
  required Function validate,
  required String? label,
  String? hint,
  required IconData? prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
  int maxLines = 1,

  // ignore: use_function_type_syntax_for_parameters
}) =>
    TextFormField(
      onTap: () {
        //onTap!();
      },
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      textInputAction: action,
      maxLines: maxLines,
      enabled: isClickable,
      //style: GoogleFonts.cairo(),
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      onChanged: (s) {
        //onChange!(s);
      },
      validator: (value) {
        return validate(value);
      },
      decoration: InputDecoration(
        //errorStyle: GoogleFonts.cairo(),
        hintText: hint,
        //hintStyle: GoogleFonts.cairo(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          /* borderSide: const BorderSide(
            color: MyColors.basColor,
            width: 2.0,
          ),*/
        ),
        labelText: label,
        //labelStyle: GoogleFonts.cairo(),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
