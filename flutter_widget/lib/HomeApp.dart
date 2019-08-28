import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  List _listaItens = ["Java", "Flutter", "Angular", "Spring Boot", "JavaScript", "NodeJs"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter widget dismissible"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Widget Dismissible",
              style: TextStyle(
                fontSize: 30,
                color: Colors.red
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _listaItens.length,
              itemBuilder: (context, index){

                final itens = _listaItens[index];

                return Dismissible(
                  background: Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.greenAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),                        
                      ],
                    ),
                  ),
                  secondaryBackground: Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.redAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  onDismissed: (direction){
                    if (direction == DismissDirection.startToEnd) {
                        print("Direção: startToEnd");
                    } else if(direction == DismissDirection.endToStart){
                        print("Direção endToStart");
                    }

                    setState(() {
                      _listaItens.removeAt(index);
                    });
                  },
                  key: Key( itens ),
                  child: ListTile(
                    title: Text(itens),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}