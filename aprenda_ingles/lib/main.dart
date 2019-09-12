import 'package:aprenda_ingles/telas/HomeApp.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: HomeApp(),
  theme: ThemeData(
    primaryColor: Color(0xff4987B3),
    scaffoldBackgroundColor: Color(0xffB5C6C6),
    accentColor: Colors.white
  ),
));

