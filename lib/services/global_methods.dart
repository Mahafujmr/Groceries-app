import 'package:flutter/material.dart';

class GlobalMethods {
  static navigateTo({required BuildContext cts, required String routeName}) {
    Navigator.pushNamed(cts, routeName);
  }
}
