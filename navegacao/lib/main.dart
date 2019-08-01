import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navegacao/TelaSegundaria.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeApp(),
    )
  );
}

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navegação"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        padding: EdgeInsets.all(35),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text(
                "Segunda Tela",
                style: TextStyle(
                  fontSize: 20,
                ),
              
              ),
              padding: EdgeInsets.all(20),
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => TelaSegundaria(valor: "Evandro Barbosa",)
                  )
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}