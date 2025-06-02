import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle headlinetextstyle(double size) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  static TextStyle normallinetextstyle(double size) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );
  }

  static TextStyle whitetextstyle(double size) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  static TextStyle greentextstyle(double size) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w500,
      color: Colors.green,
    );
  }
}
