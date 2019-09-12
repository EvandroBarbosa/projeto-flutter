import 'package:flutter/material.dart';

import 'Bicho.dart';
import 'Numero.dart';
import 'Vogal.dart';

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> with SingleTickerProviderStateMixin{

  TabController _tabController;


  @override
  void initState() {
    super.initState();
      _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();

    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aprenda Inglês"),
        bottom: TabBar(
          indicatorWeight: 4,
          indicatorColor: Colors.red,
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              text: "Bichos",
            ),
            Tab(text: "Números",),
            Tab(text: "Vogais",)
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Bicho(),
          Numero(),
          Vogal()
        ],
      ),
    );
  }
}