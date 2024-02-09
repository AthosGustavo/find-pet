import 'package:flutter/material.dart';

InputDecoration InputDecorationLogin(String labelText,Icon icone, {String hintText = ''}) {
  
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(int.parse('0xFF859CEF')), width: 2),
      borderRadius: BorderRadius.circular(25),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(int.parse('0xFF4C76E9')), width: 2),
      borderRadius: BorderRadius.circular(25),
    ),
    labelText: labelText,
    labelStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Color(int.parse('0xFF132C29'))),
    hintText: hintText,
    prefixIcon: icone,
    floatingLabelBehavior: FloatingLabelBehavior.always
  );
}

