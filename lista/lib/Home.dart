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
      item["descricao"] = "Descrição ${i} o Dolar hoje esta a R\$ 3,95 com queda de 0.89%";
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
              onTap: (){
                // print("Clique selecionado");
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(_itens[index]["titulo"]),
                      titlePadding: EdgeInsets.all(20),
                      titleTextStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.red
                      ),
                      content: Text(_itens[index]["descricao"]),
                      actions: <Widget>[
                        FlatButton(
                          color: Colors.green,
                          child: Text(
                            "Sim",
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                          onPressed: (){
                            print("Selecionado sim");
                            Navigator.pop(context);
                          },
                        ),
                        FlatButton(
                          color: Colors.red,
                          child: Text(
                            "Não",
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                          onPressed: (){
                            print("Selecionado não");
                            Navigator.pop(context);
                          },
                        )
                      ],
                    );
                  }
                );
              },
              title: Text(_itens[index]["titulo"]),
              subtitle: Text(_itens[index]["descricao"]),
            );
          },
        ),
      ),
    );
  }
}