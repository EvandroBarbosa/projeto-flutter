import 'package:flutter/material.dart';

class EntradaCheckbox extends StatefulWidget {
  @override
  _EntradaCheckboxState createState() => _EntradaCheckboxState();
}

class _EntradaCheckboxState extends State<EntradaCheckbox> {

  bool _selecionado = false;
  bool _comidaBrasileira = false;
  bool _comidaMexicana = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        child: Column(
         
          children: <Widget>[
            CheckboxListTile(
              title: Text("Comida Brasileira"),
               subtitle: Text("A melhor comido da região"),
              // activeColor: Colors.brown,
              // secondary: Icon(Icons.add_box),
              // selected: true,

              value: _comidaBrasileira,
              onChanged: (bool valor){
                setState(() {
                  _comidaBrasileira = valor;
                });
              },
            ),
            
            CheckboxListTile(
              title: Text("Comida Mexicana"),
              subtitle: Text("Uma boa pedida"),
              value: _comidaMexicana,
              onChanged: (bool valor) {
                setState(() {
                  _comidaMexicana = valor;
                });
              },
            ),

            RaisedButton(
              child: Text("Salvar"),
              onPressed: () {
                print(
                  "Comida Brasileira "+ _comidaBrasileira.toString() +
                  " \nComida Mexicana "+ _comidaMexicana.toString()
                );
              },
            ),

            /* Checkbox(
              value: _selecionado,
              onChanged: (bool valor) {
                setState(() {
                 _selecionado = valor;
                });
              },
            ), */
          ],
        ),
      ),
    );
  }
}