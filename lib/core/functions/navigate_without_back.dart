import 'package:flutter/material.dart';

Future<dynamic> naviagteWithoutBack(BuildContext context, Widget view) {
  return Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => view));
}
