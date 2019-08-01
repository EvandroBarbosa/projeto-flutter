import 'package:flutter/material.dart';

class TelaEmpresa extends StatefulWidget {
  @override
  _TelaEmpresaState createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Empresa"),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset("images/detalhe_empresa.png"),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Sobre a Empresa",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.redAccent
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa,"
                  "Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa,"
                  "Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa,"
                  "Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa,"
                  "Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa, Sobre a empresa"
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}