import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  String _texto = "Nada Salvo";
  TextEditingController _controllerTexto = TextEditingController();

  _salvar() async {

    String textoDigitado = _controllerTexto.text;
    final prefs = await SharedPreferences.getInstance();

    if(textoDigitado.isNotEmpty)
      await prefs.setString("nome", textoDigitado);
    else
      setState(() {
        _texto = "O texto não pode ser vazio";
      });
    print("Texto digitado: $textoDigitado");

  }

  _ler() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _texto = prefs.getString("nome") ?? "Sem conteudo!";
    });
  }

  _remover() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("nome");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de dados"),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text(
              _texto,
              style: TextStyle(
                fontSize: 20
              ),
            ),
            TextField( 
              style: TextStyle(
                fontSize: 20
              ),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Digite Algo",                
              ),
              controller: _controllerTexto,           
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Row(
              children: <Widget>[
                RaisedButton(
                  color: Colors.brown,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Salvar",
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  onPressed: _salvar,
                ),
                RaisedButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Ler",
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  onPressed: _ler,
                ),
                RaisedButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Remover",
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  onPressed: _remover,
                )
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}