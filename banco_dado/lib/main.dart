import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: HomeApp(),
));

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  List _listaUsuario = List();

//Recuperando uma instancia do banco de dados
  _recupararBancoDados() async {

    //Recupera o caminho do banco de dados no aparelho
    final caminhoBancoDado = await getDatabasesPath();
   
    //Passa o local onde o banco ficará armazenado no aparelho
    final localBancoDados = join(caminhoBancoDado, "banco.db");

   var bd = await openDatabase(
      localBancoDados,
      version: 1,
      onCreate: (db, dbVersao){
        //Instrução sql para criar uma tabela na base de dado
        String sql = "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR(50), idade INTEGER) ";
        //Executa as instruções sql no banco
        db.execute(sql);
      }
    );

    return bd;  
  }

  _salvar() async {
    //Criando uma instancia do banco de dados
    Database db = await _recupararBancoDados();

    Map<String, dynamic> dadosUsuarios = {
      "nome" : "Bruna Gata",
      "idade" : 26
    };

    int id = await db.insert("usuarios", dadosUsuarios);
    print("Id Salvo: $id");
  }


  _lerDados() async {
    Database db = await _recupararBancoDados();

    //Lendo os dados do banco 
    String sql = "SELECT * FROM usuarios";
    // String sql = "SELECT * FROM usuarios WHERE 1=1 ORDER BY nome ASC";
    List dadosUsuarios = await db.rawQuery(sql);

    for (var usuario in dadosUsuarios) {
      Map<String, dynamic> pessoa = {
        "Nome" : usuario["nome"],
        "Idade" : usuario["idade"]
      };
      _listaUsuario.add(pessoa);
    }



  }

  _listarUsuarioPorId(int id) async {
    Database db = await _recupararBancoDados();

   List usuarios = await db.query(
      "usuarios",
      where: "id = ?",
      whereArgs: [id]
    );

    for (var usuario in usuarios) {
      print("Usuario id: "+usuario["id"].toString()+
        " nome: "+usuario["nome"]+
        " idade: "+usuario["idade"].toString()
      );
    }
    
  }

  _deleteUsuario(int id) async {
    Database db = await _recupararBancoDados();

    // String sql = "DELETE FROM usuarios WHERE id = 2";

    db.delete(
      "usuarios",
      where: "id = ?",
      whereArgs: [id]
    );
  
  }

  _atualizarUsuario(int id) async {
    Database db = await _recupararBancoDados();

    Map<String, dynamic> atualizar = {
      "nome" : "Rodrigo Brunet",
      "idade" : 27
    };

    db.update(
      "usuarios", 
      atualizar,
      where: "id = ?",
      whereArgs: [id]
      );
  }

  @override
  void initState() {
    super.initState();
    _lerDados();
  }

  @override
  Widget build(BuildContext context) {

//    _salvar();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Banco de Dados"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Lista de Usuarios",
              style: TextStyle(
                fontSize: 20
              ),
            ),
          ),
           Expanded(
            child: ListView.builder(
              itemCount: _listaUsuario.length,
              itemBuilder: (context, index){


                return ListTile(
                  title: Text(_listaUsuario[index].toString()),
//                  subtitle: Text(item["idade"].toString()),
                );
              },
            )
          )
        ],
      ),
    );
  }
}
