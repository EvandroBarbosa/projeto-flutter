import 'package:flutter/material.dart';

class AlcoolGasolina extends StatefulWidget {
  @override
  _AlcoolGasolinaState createState() => _AlcoolGasolinaState();
}

class _AlcoolGasolinaState extends State<AlcoolGasolina> {
  //Variaveis para capturas os valores dos inputs
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado ="";

  void _calcular(){
   double precoAlccol =double.tryParse( _controllerAlcool.text);

   double precoGasolina = double.tryParse(_controllerGasolina.text);

   if(precoAlccol == null || precoGasolina == null){
     setState(() {
       _textoResultado = "Número inválido, digite números maiores que 0 e utilizando (.) !";
     });
   }else {
     
     //Calculo do combustivel, para decidir com qual é melhor abastecer
     //se O preço do alcool divido pela gasolina for >= 0.7 abasteça com alcool se não gasolina

    if ((precoAlccol / precoGasolina) >= 0.7) {
      setState(() {
       _textoResultado = "Melhor abastecer com gasolina!";
     });
    } else {
      setState(() {
       _textoResultado = "Melhor abastecer com Alcool!";
     });

     //Metodo para limpar os campos apos submete-los
    //  _limparCampos();
    }

   }
  }
  
  void _limparCampos(){
    _controllerAlcool.text = "";
    _controllerGasolina.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou Gasolina"),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("images/logo.png"),
                
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço do Alcool, ex: 1.59"
                ),
                style: TextStyle(
                  fontSize: 22
                ),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço da Gasolina, ex: 2.59"
                ),
                style: TextStyle(
                  fontSize: 22
                ),
                controller: _controllerGasolina,
              ),

              Padding(
                padding: EdgeInsets.only(top: 10),
                child:  RaisedButton(
                  color: Colors.lightBlue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      fontSize: 20
                      
                    ),
                  ),
                  onPressed: () => _calcular(),
                  
                ),             
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}