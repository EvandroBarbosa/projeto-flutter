import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  @override
  void initState() {
    // Processo que inicia uma statefull
    super.initState();
    print("Chamado 1: iniciando a stateful = initState");
  }

  @override
  void didChangeDependencies() {
    // Processo que carregas as dependencias do app
    super.didChangeDependencies();
    print("Chamdo 2: carregando as dependencias = didChangeDependencies");
  }

  @override
  void didUpdateWidget(HomeApp oldWidget) {
    // Atualiza um processo que esta cendo executado no momento
    super.didUpdateWidget(oldWidget);
    print("Chamado 2: Atualiza os processo = didUpdateWidget");
  }

  @override
  void dispose() {
    // Mata um processo que esta sendo execultado
    super.dispose();
    print("Chamado 4: Elemina um processo ao chamar outro = dispose");
  }

  @override
  Widget build(BuildContext context) {
    print("Chamado 3: criando a stateful ou a tela = build");

    return Scaffold(
      appBar: AppBar(
        title: Text("Ciclo de Vida"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              print("Clicado");
            },
          )
        ],        
      ),
      body: Container(
        child: Center(
          child: Text(
            "Ciclo de Vida de uma statefulWidget",
            style: TextStyle(
              fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}