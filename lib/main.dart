import 'package:flutter/material.dart';
import 'package:siska_improve/app.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() {
  FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
  FlutterStatusbarcolor.setNavigationBarColor(Colors.blue);
  runApp(App());
}
