import 'package:flutter/material.dart';

final kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white70,
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide.none),
  hintText: 'Enter city name',
  hintStyle: TextStyle(
    color: Colors.grey[900],
  ),
);
