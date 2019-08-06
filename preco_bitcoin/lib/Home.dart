import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _preco = "0";

  void _recuperarPreco() async {

    String url = "https://blockchain.info/ticker";

    http.Response resp;
    resp = await http.get(url);
    Map<String, dynamic> retorno = json.decode( resp.body );

    setState(() {
      _preco = retorno["BRL"]["buy"].toString();
    });
    // print("Resultado: "+retorno["BRL"]["buy"].toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/bitcoin.png"),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "R\$ " + _preco,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            RaisedButton(
              child: Text(
                "Atualizar",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),
              ),
              color: Colors.orange,
              padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
              onPressed: _recuperarPreco,
            )
          ],
        ),
      ),
    );
  }
}