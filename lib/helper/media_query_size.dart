import 'package:flutter/material.dart';

class MediaQuerySize {
  static double height(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return size;
  }

  static double width(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return size;
  }
}
