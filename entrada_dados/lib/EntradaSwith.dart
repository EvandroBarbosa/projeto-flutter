import 'package:flutter/material.dart';

class EntradaSwith extends StatefulWidget {
  @override
  _EntradaSwithState createState() => _EntradaSwithState();
}

class _EntradaSwithState extends State<EntradaSwith> {
  bool _escolhaUsuario = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Entrada de Dados"),
        backgroundColor: Colors.black,
      ) ,
      body: Container(
        child: Column(
          children: <Widget>[
            SwitchListTile(
              title: Text("Receber notificações?"),
              value: _escolhaUsuario,
              onChanged: (valor){
                setState(() {
                  _escolhaUsuario = valor;
                });
              },
            ),

            /* Switch(
              value: _escolhaUsuario,
              onChanged: (bool valor){
                setState(() {
                  _escolhaUsuario = valor;
                });
              },
            ), 
            Text("Receber Notificaçoes?"),
            */
            RaisedButton(
              color: Colors.blue,
              child: Text(
                "Salvar",
                style:  TextStyle(
                  fontSize: 25,
                  color: Colors.white                 
                ),
              ),
              onPressed: (){
               
               if (_escolhaUsuario) {
                 print("Escolha: Ativar as notificações");
               } else {
                  print("Escolha: Não ativar as notificações");
               }
               
              },
            )
          ],
        ),
      ),
    );
  }
}