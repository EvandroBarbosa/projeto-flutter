import 'package:anotacoes/model/Anotacao.dart';
import 'package:anotacoes/helper/AnotacaoHelper.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  TextEditingController _tituloController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();

  var _db = AnotacaoHelper();
  List<Anotacao> _anotacoes = List<Anotacao>();

  Anotacao _ultimaAnotacaoRemovida;


  _exibirTelaCadastro( {Anotacao anotacao} ){

    String textoSalvarAtualizar = "";
    if(anotacao == null){//Salvando anotação
      _tituloController.text = "";
      _descricaoController.text = "";
      textoSalvarAtualizar = "Salvar";
    }else{//Atualizando anotação
      _tituloController.text = anotacao.titulo;
      _descricaoController.text = anotacao.descricao;
      textoSalvarAtualizar = "Atualizar";
    }

    showDialog(
      context: context,
      builder: (context){

        return AlertDialog(
          title: Text("$textoSalvarAtualizar uma anotação"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _tituloController,
                decoration: InputDecoration(
                  labelText: "Titulo",
                  hintText: "Digite um titulo"
                ),
                autofocus: true,
              ),
              TextField(
                controller: _descricaoController,
                decoration: InputDecoration(
                  labelText: "Descrição",
                  hintText: "Digite uma descrição"
                ),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () => Navigator.pop(context),
            ),
            FlatButton(
              child: Text(textoSalvarAtualizar),
              onPressed: () {
                _salvarAtualizarAnotacao(editarAnotacao: anotacao);
                Navigator.pop(context);
              },
            )
          ],
        );
      }
    );
  }

  _recuperarAnotacoes() async {

    List listaAnotacoes = await _db.getAnotacoesAll();

    List<Anotacao> listaTemporaria = List<Anotacao>();

    for(var item in listaAnotacoes){

      Anotacao anotacao = Anotacao.fromMap(item);

      listaTemporaria.add(anotacao);
    }

    setState(() {
      _anotacoes = listaTemporaria;
    });
    listaTemporaria = null;
  }

  _salvarAtualizarAnotacao( {Anotacao editarAnotacao} ) async {

    String titulo = _tituloController.text;
    String descricao = _descricaoController.text;

    if(editarAnotacao == null){//Salvar Anotação
      Anotacao anotacao = Anotacao(titulo, descricao, DateTime.now().toString());
     int resultado = await _db.salvarAnotacao(anotacao);

    }else{//Atualizar Anotação
     editarAnotacao.titulo = titulo;
     editarAnotacao.descricao = descricao;
     editarAnotacao.data = DateTime.now().toString();

     int resultado = await _db.atualizarAnotacao(editarAnotacao);

    }

    _tituloController.clear();
    _descricaoController.clear();

    _recuperarAnotacoes();
  }

  _formatarData(String data) {

    initializeDateFormatting("pt_BR");

    var formateDate = DateFormat.yMd("pt_BR");

    DateTime convertDate = DateTime.parse(data);
    String dataFormatada = formateDate.format(convertDate);

    return dataFormatada;
  }

  _removerAnotacao( int id ) async {

    await _db.removerAnotacao(id);

    _recuperarAnotacoes();
  }

  @override
  void initState() {
    super.initState();
    _recuperarAnotacoes();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas Anotações"),
        backgroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){_exibirTelaCadastro();},
        child: Icon(Icons.edit),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _anotacoes.length,
              itemBuilder: (context, index){

                final item = _anotacoes[index];

                return Dismissible(
                  direction: DismissDirection.endToStart,
                   onDismissed: (direction){

                    //Recuperar ultimo item removido
                     _ultimaAnotacaoRemovida = _anotacoes[index];

                   //Remover item do banco
                     _removerAnotacao(item.id);

                    final snackbar = SnackBar(
                      backgroundColor: Colors.white,
                      content: Text(
                          "Deseja remover essa anotação?",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red
                          ),
                      ),
                      action: SnackBarAction(
                        textColor: Colors.black,
                        label: "Desfazer",
                        onPressed: (){

                        },
                      ),
                    );
                    Scaffold.of(context).showSnackBar(snackbar);
                  },

                  background: Container(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.delete,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ),
                  key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
                  child: Card(
                    child:  ListTile(
                      title: Text(item.titulo),
                      subtitle: Text("${_formatarData(item.data)} - ${item.descricao}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              _exibirTelaCadastro(anotacao: item);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 0),
                              child: Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
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