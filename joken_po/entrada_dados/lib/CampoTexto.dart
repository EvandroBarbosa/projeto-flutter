
import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text(
          "Entrada de Dados"
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(32),
            child: TextField(
              //Tipo text, number, emailAddress, datetime
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Digite um valor",
              ),
              //enabled: false, desabilita o input
              // maxLength: 6,
              // maxLengthEnforced: false,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.red
              ),
              // obscureText: true,
              /* onChanged: (String v){
                print("valor digitado "+ v);
              }, */
              onSubmitted: (String v) {
                print("Valor digitado = "+v);
              },
              controller: _textEditingController,
            ),
          ),
          RaisedButton(
            child: Text("Salvar"),
            color: Colors.amber,
            onPressed: (){
              print("Valor digitado = "+ _textEditingController.text);
            },
          )
        ],
      ),
    );
  }
}