import 'package:flutter/material.dart';

class EntrdaSlider extends StatefulWidget {
  @override
  _EntrdaSliderState createState() => _EntrdaSliderState();
}

class _EntrdaSliderState extends State<EntrdaSlider> {

  double _valor = 0;

  String _valorSelecionado = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        padding: EdgeInsets.only(top:60),
        child: Column(
          children: <Widget>[
            Slider(
              value: _valor,
              min: 0,
              max: 100,
              label: _valorSelecionado,
              divisions: 10,
              activeColor: Colors.green,
              inactiveColor: Colors.red,
              onChanged: (double v){
                setState(() {
                  _valor = v;
                  _valorSelecionado = v.toString();
                });
                // print("Valor selecionado "+ _valor.toString());
              },
            ),

            RaisedButton(
              color: Colors.yellowAccent,
              child: Text(
                "Salvar",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.redAccent
                ),
              ),
              onPressed: (){
                print("Valor Selecionado "+ _valor.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}