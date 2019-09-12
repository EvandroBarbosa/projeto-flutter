import 'package:flutter/material.dart';

class Vogal extends StatefulWidget {
  @override
  _VogalState createState() => _VogalState();
}

class _VogalState extends State<Vogal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Vogais")
      ],
    );
  }
}