import 'package:flutter/material.dart';

class EntradaRadioButton extends StatefulWidget {
  @override
  _EntradaRadioButtonState createState() => _EntradaRadioButtonState();
}

class _EntradaRadioButtonState extends State<EntradaRadioButton> {

  String _escolhaUsuario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados"),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            RadioListTile(
              title: Text("Masculino"),
              value: "M",
              groupValue: _escolhaUsuario,
              onChanged: (String valor){
                setState(() {
                  _escolhaUsuario = valor;
                });
              },
            ),

            RadioListTile(
              title: Text("Feminino"),
              value: "F",
              groupValue: _escolhaUsuario,
              onChanged: (valor){
                setState(() {
                  _escolhaUsuario = valor;
                });
              },
            ),

            RadioListTile(
              title: Text("Outro"),
              value: "O",
              groupValue: _escolhaUsuario,
              onChanged: (valor){
                setState(() {
                  _escolhaUsuario = valor;
                });
              },
            ),

            /* Text("Masculino"),
            Radio(
              value: "m",
              groupValue: _escolhaUsuario,
              onChanged: (String valor){
                setState(() {
                  _escolhaUsuario = valor;
                });
                print("Resultado "+ valor);
              },
            ),

            Text("Feminino"),
            Radio(
              value: "f",
              groupValue: _escolhaUsuario,
              onChanged: (String valor){
                setState(() {
                  _escolhaUsuario = valor;
                });
                print("Resultado "+ valor);
              },
            ) */

            RaisedButton(
              child: Text("Salvar"),
              onPressed: (){
                print("Resultado "+ _escolhaUsuario.toString());
              },
            )
          ],
        ),
      ),
    );
  }
}