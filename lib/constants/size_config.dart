import 'package:flutter/material.dart';

class SizeConfig {
  static late double swidth;
  static late double sheight;

  void init(BuildContext context) {
    swidth = MediaQuery.of(context).size.width;
    sheight = MediaQuery.of(context).size.height;
  }
}
