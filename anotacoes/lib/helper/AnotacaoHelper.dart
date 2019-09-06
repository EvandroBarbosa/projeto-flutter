import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:anotacoes/model/Anotacao.dart';


class AnotacaoHelper {

  static final AnotacaoHelper _anotacaoHelper = AnotacaoHelper._internal();

  static final String nomeTabela = "anotacao";
  static final String colunaId = "id";
  static final String colunaTitulo = "titulo";
  static final String colunaDescricao = "descricao";
  static final String colunaData = "data";

  Database _db;

  factory AnotacaoHelper(){
    return _anotacaoHelper;
  }

  AnotacaoHelper._internal();
  

  get db async{

    if (_db != null) {
      return _db;
    } else {
     _db = await inicializarDB();
     return _db;
    }
  }

  _onCreate(Database db, int version) async {

    String sql = "CREATE TABLE $nomeTabela ("
      "$colunaId INTEGER PRIMARY KEY AUTOINCREMENT, "
      "$colunaTitulo VARCHAR, "
      "$colunaDescricao TEXT, "
      "$colunaData DATETIME )";
    await db.execute(sql);
  }

  inicializarDB() async {

    final camimhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(camimhoBancoDados, "banco_anotacao.db");

    var db = await openDatabase(localBancoDados, version: 1, onCreate: _onCreate);

    return db;
  }

  Future<int> salvarAnotacao(Anotacao anotacao) async {
    
    var bancoDados = await db;
    int resultado = await bancoDados.insert(nomeTabela, anotacao.toMap());
    return resultado;
  }

  Future<int> atualizarAnotacao(Anotacao anotacao) async {
    var bancoDados = await db;
    return await bancoDados.update(
      nomeTabela,
      anotacao.toMap(),
      where: "id = ?",
      whereArgs: [anotacao.id]
    );
  }

  Future<int> removerAnotacao(int id) async {

    var bancoDados = await db;

    return await bancoDados.delete(
      nomeTabela,
      where: "id = ?",
      whereArgs: [id]
    );

  }

  getAnotacoesAll() async {
    var bancoDados = await db;

    String sql = "SELECT * FROM $nomeTabela ORDER BY $colunaData DESC";
    List consulta = await bancoDados.rawQuery(sql);

    return consulta;
  }

}