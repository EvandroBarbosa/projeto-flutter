import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main () => runApp(HomeApp());

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Frases do dia",
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _frases = [
    "Sou apenas um pequeno planeta que se perde diariamente em todo o seu universo",
    "Novas amizades serão sempre bem-vindas para darem cor e alegria ao meu mundo",
    "Gratidão não é pagamento, mas um reconhecimento que se demonstra no dia a dia",
    "Nem toda mudança importante acontece de repente e faz barulho, algumas vêem em silêncio"
    ];
  
  var _frasesGerada = "Clique a abaixo para gerar uma nova frase";

  void _gerarFrase(){
    var numeroSorteado = Random().nextInt(_frases.length);

    setState(() {
    _frasesGerada = _frases[ numeroSorteado ];      
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do Dia"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset("images/logo.png"),
              Text(
                _frasesGerada,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 25, 
                  fontStyle: FontStyle.italic,
                  color: Colors.black
                ),
              ),
              RaisedButton(
                child: Text(
                  "Nova Frase",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),                  
                ),
                color: Colors.blueGrey,
                onPressed: _gerarFrase,
              )
            ],
          ),
        ),
      ),
      
    );
  }
}