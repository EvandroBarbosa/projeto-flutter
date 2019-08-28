import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:path_provider/path_provider.dart';

class HomeLista extends StatefulWidget {
  @override
  _HomeListaState createState() => _HomeListaState();
}

class _HomeListaState extends State<HomeLista> {

  List _listaTarefas = [];

  TextEditingController _controllerTarefa = TextEditingController();

  Future<File> _getFile() async {

    final diretorio = await getApplicationDocumentsDirectory();
    var arquivo = File("${diretorio.path}/dados.json");
  }

  //Esse método salva os dados capturado da tela
  _salvar() {

    String texto = _controllerTarefa.text;

    Map<String, dynamic> tarefa = Map();
    tarefa["titulo"] = texto;
    tarefa["realizada"] = false;

    setState(() {
      _listaTarefas.add(tarefa);
    });

    _salvarDados();

    _controllerTarefa.text = "";
  }

  //Esse método salva os dados no arquivo do aplicação no aparelho
  _salvarDados() async {

    var arquivo =  await _getFile();

    String dados = json.encode(_listaTarefas );
    arquivo.writeAsString(dados);

  }

  _lerDados() async {

    try{

      final arquivo = await _getFile();
      return arquivo.readAsString();

    }catch(error){
      return null;
    }
  }

  @override
  void initState() {
    super.initState();

    _lerDados().then((dados){
      setState(() {
        _listaTarefas = json.decode(dados);
      });
    });
  }

  @override
  Widget build(BuildContext context) {

//    print("Resultado"+_listaTarefas.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
                "Este App é para você anotar aquilo que queira fazer ex: lista de compra",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue
                ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _listaTarefas.length,
              itemBuilder: (context, index){

                return CheckboxListTile(
                  title: Text(_listaTarefas[index]["titulo"]),
                  value: _listaTarefas[index]["realizada"],
                  onChanged: (valorAlterado){

                    setState(() {
                      _listaTarefas[index]["realizada"] = valorAlterado;
                    });

                    _salvarDados();

                  },
                );

                /*return ListTile(
                  title: Text(_listaTarefas[index]["titulo"]),
                );*/
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        onPressed: (){
          showDialog(
             context: context,
            builder: (context){
               return AlertDialog(
                 title: Text("Adicionar itens a lista"),
                 content: TextField(
                   controller: _controllerTarefa,
                   decoration: InputDecoration(
                     labelText: "Digite a tarefa",
                   ),
                   onChanged: (Texto){},
                 ),
                 actions: <Widget>[
                   FlatButton(
                     child: Text("Cancelar"),
                     onPressed: () => Navigator.pop(context),
                   ),
                   FlatButton(
                     child: Text("Salvar"),
                     onPressed: (){
                       _salvar();
                       Navigator.pop(context);
                     },
                   )
                 ],
               );
            }
          );
        },
      ),
    );
  }
}
