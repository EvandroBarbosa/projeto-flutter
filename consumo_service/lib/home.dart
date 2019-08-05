import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  String _resultado = "Resultado";
  TextEditingController _controller = TextEditingController();

  _recuperarCep() async {
    String cepDigitado = _controller.text;
    String url = "http://viacep.com.br/ws/${cepDigitado}/json/";
    http.Response resp;
    resp = await http.get(url);
    Map<String, dynamic> retorno = json.decode(resp.body);
    String cep = retorno["cep"];
    String logradouro = retorno["logradouro"];
    String localidade = retorno["localidade"];
    String uf = retorno["uf"];
    // print("Cep: "+cep+ "\nRua: "+logradouro+ "\nLocalidade: "+localidade+"\nUf: "+uf);

    setState(() {
      _resultado = "${cep},\n ${logradouro},\n ${localidade},\n ${uf}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comsumo de serviço web"),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite o Cep: ex: 75260270"
              ),
              style: TextStyle(fontSize: 20),
              controller: _controller,
            ),
            RaisedButton(
              child: Text("Clique aqui"),
              onPressed: _recuperarCep,
            ),
            Text(
              _resultado,
              style: TextStyle(
                fontSize: 20
              ),
            ),
          ],
        ),
      ),
    );
  }
}