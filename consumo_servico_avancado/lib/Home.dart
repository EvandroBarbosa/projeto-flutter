import 'dart:convert';

import 'package:consumo_servico_avancado/Fipe.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String url = "https://fipeapi.appspot.com/api/1/carros/marcas.json";

  Future<List<Fipe>> _recuperarDados() async {
    http.Response resp = await http.get(url);
    var dadosJson = json.decode(resp.body);

    List<Fipe> lista = List();
    for (var dados in dadosJson) {
      Fipe fp = Fipe(dados["id"], dados["order"], dados["name"], dados["fipe_name"], dados["key"]);
      lista.add(fp);
    }

    return lista;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço avançado"),
        backgroundColor: Colors.blueGrey,
      ),
      body: FutureBuilder<List<Fipe>>(
        future: _recuperarDados(),
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return CircularProgressIndicator();
              break;
            case ConnectionState.active:
            case ConnectionState.done:

            if (snapshot.hasError) {
              
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index){

                  List<Fipe> fipe = snapshot.data;
                  Fipe fp = fipe[index];
                    
                  // print("Lista de marcas: "+fp.name);

                  return ListTile(
                    title: Text(fp.name),
                    subtitle: Text(
                      fp.key + "\n" +
                      fp.fipe_name
                    ),

                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}