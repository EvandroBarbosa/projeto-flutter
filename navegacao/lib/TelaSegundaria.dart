import 'package:flutter/material.dart';

class TelaSegundaria extends StatefulWidget {

  String valor;
  TelaSegundaria({this.valor});

  @override
  _TelaSegundariaState createState() => _TelaSegundariaState();
}

class _TelaSegundariaState extends State<TelaSegundaria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda Tela"),
        backgroundColor: Colors.blueGrey
      ),
      body: Container(
        padding: EdgeInsets.all(35),
        child: Column(
          children: <Widget>[
            Text(
              "Segunda Tela! valor passado: ${widget.valor}",
              style: TextStyle(fontSize: 20),
            ),
            
          ],
        ),
      ),
    );
  }
}