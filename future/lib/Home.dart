import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<Map> _recuperarInformacao() async {
    String url = "https://blockchain.info/ticker";
    http.Response resp = await http.get(url);

    return json.decode(resp.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dados da Fipe"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: FutureBuilder<Map>(
          future: _recuperarInformacao(),
          builder: (context, snapshot){
            String resultado;
            switch ( snapshot.connectionState ) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                resultado = "Carregando...";
                break;
              case ConnectionState.active:
              case ConnectionState.done:

              if (snapshot.hasError) {
                resultado = "Error ao carregar os dados...";
              }else{
                double valor = snapshot.data["BRL"]["buy"];
                resultado = "Preço do Bitcoin: "+valor.toString();
              }
               break;
            }
            return Center(
              child: Text(
                resultado,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}