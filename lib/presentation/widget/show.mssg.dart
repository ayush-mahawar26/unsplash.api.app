import 'package:flutter/material.dart';

class ShowMessage {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackbar(
      {required String mssg, required BuildContext context}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(mssg),
      duration: const Duration(seconds: 1),
    ));
  }
}
