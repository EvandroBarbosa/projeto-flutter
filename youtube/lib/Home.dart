import 'package:flutter/material.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/tela/Biblioteca.dart';
import 'package:youtube/tela/EmAlta.dart';
import 'package:youtube/tela/Inicio.dart';
import 'package:youtube/tela/Inscricao.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceItems = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio( _resultado ),
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey
        ),
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: (){
              print("Ação: video chamada");
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String res = await showSearch(context: context, delegate: CustomSearchDelegate());
              setState(() {
                _resultado = res;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){
              print("Ação: perfil");
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceItems],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceItems,
        onTap: (indice){
          setState(() {
            _indiceItems = indice; 
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Colors.red,
            icon: Icon(Icons.home),
            title: Text("Inicio"),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.teal,
            icon: Icon(Icons.whatshot),
            title: Text("Em altas"),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.amber,
            icon: Icon(Icons.subscriptions),
            title: Text("Inscrições"),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.grey,
            icon: Icon(Icons.folder),
            title: Text("Biblioteca"),
          )
        ],
      ),
    );
  }
}
