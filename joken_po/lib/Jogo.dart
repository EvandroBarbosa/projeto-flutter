import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("images/padrao.png");

  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario){
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    //Exibição da imagem escolhida pelo App
    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
       break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
     
    }

    //Validação do ganhador
    if( 
        ( escolhaUsuario == "pedra" && escolhaApp == "tesoura" ) ||
        ( escolhaUsuario == "tesoura" && escolhaApp == "papel" ) ||
        ( escolhaUsuario == "papel" && escolhaApp == "pedra" )

      ){

        setState(() {
          this._mensagem = "Parabéns você ganhou :)";
        });

    //App ganhador
    } else if(
        ( escolhaApp == "pedra" && escolhaUsuario == "tesoura" ) ||
        ( escolhaApp == "tesoura" && escolhaUsuario == "papel" ) ||
        ( escolhaApp == "papel" && escolhaUsuario == "pedra" )
    ){

      setState(() {
        this._mensagem = "Que pena você perdeu :(";
      });
    } else{
      setState(() {
        this._mensagem = "Empatamos :)";
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(image: this._imagemApp,),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 16),
            child: Text(
              _mensagem,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
            children: <Widget>[
              GestureDetector(
                onTap:() => _opcaoSelecionada("pedra"),
                child: Image.asset("images/pedra.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("images/papel.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("images/tesoura.png", height: 100,),
              ),
              // ,
              // ,
              // 
            ],
          )
        ],
      ),
    );
  }
}