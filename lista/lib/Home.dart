import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _itens = [];

  void _recuperarItens(){
    _itens = [];

    for (var i = 0; i <= 10; i++) {
      Map<String, dynamic> item = Map();
      item["titulo"] = "Titulo ${i} Valor do dolar";
      item["descricao"] = "Descrição ${1} o Dolar hoje esta a R\$ 3,95 com queda de 0.89%";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    _recuperarItens();
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: ListView.builder(
          itemCount: _itens.length,
          itemBuilder: (context, index){
            print("Item: ${_itens[index]["titulo"]}");

            return ListTile(
              title: Text(_itens[index]["titulo"]),
              subtitle: Text(_itens[index]["descricao"]),
            );
          },
        ),
      ),
    );
  }
}