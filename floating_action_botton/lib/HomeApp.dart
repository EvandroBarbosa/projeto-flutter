import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Floating Action Botton"),
      ),
      body: Center(
        child: Text("Contéudo!"),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.grey,
        foregroundColor: Colors.red,
        elevation: 6,
        icon: Icon(Icons.add_shopping_cart),
        label: Text("Adicionar"),
        /*shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),*/
//        mini: true,
        /*child: Icon(Icons.add_circle),
        onPressed: (){
          print("Resultado: botão precionado");
        },*/
      ),
      bottomNavigationBar: BottomAppBar(
//        shape: CircularNotchedRectangle(),
        color: Colors.blue,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.add),
            )
          ],
        ),
      )
    );
  }
}
