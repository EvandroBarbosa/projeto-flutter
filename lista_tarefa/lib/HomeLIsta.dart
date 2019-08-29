import 'dart:convert';
import 'dart:io';
import 'dart:async';

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

  Map<String, dynamic> _ultimaTarefaRemovida = Map();

  TextEditingController _controllerTarefa = TextEditingController();

 Future<File> _getFile() async {

    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/dados.json");
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

  Widget criarItemLista(context, index){

    // final item = _listaTarefas[index]["titulo"];

    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (direction){

        //Recuperar o ultimo item removido
        _ultimaTarefaRemovida = _listaTarefas[index];

        //Removendo item da lista
        _listaTarefas.removeAt(index);
        _salvarDados();

        //snackbar
        final snackbar = SnackBar(
          //Podemos configurar a duração da snackbar
          //Exemplo
          // duration: Duration(seconds: 5),
          content: Text("Deseja desfazer essa ação"),
          action: SnackBarAction(
            textColor: Colors.red,
            label: "Desfazer",
            onPressed: (){
              //Inserir novamente item removido da lista de tarefas
              setState(() {
                _listaTarefas.insert(index, _ultimaTarefaRemovida);
              });
              _salvarDados();

            },
          ),
        );

        //Exibindo o snackbar
        Scaffold.of(context).showSnackBar(snackbar);

      },
      background: Container(
        padding: EdgeInsets.all(16),
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            )
          ],
        ),
      ),

      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      child: CheckboxListTile(
        title: Text(_listaTarefas[index]["titulo"]),
        value: _listaTarefas[index]["realizada"],

        onChanged: (valorAlterado){

          setState(() {
            _listaTarefas[index]["realizada"] = valorAlterado;
          });

          _salvarDados();

        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        onPressed: (){
          showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                title: Text("Adicione suas tarefas do dia"),
                content: TextField(
                  controller: _controllerTarefa,
                  decoration: InputDecoration(
                    labelText: "Digite sua tarefa"
                  ),
                  onChanged: (text){},
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
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: Image.asset(
              "images/tarefa.png",
              height: 120,
            )
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _listaTarefas.length,
              itemBuilder: criarItemLista,
            ),
          ),
        ],
      ),
    );
  }
}
