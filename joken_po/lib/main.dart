import 'package:flutter/material.dart';

import 'Jogo.dart';

void main() => runApp(JokenPo());

class JokenPo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Jogo(),
    );
  }
}
