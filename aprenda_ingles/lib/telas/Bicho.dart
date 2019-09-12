import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class Bicho extends StatefulWidget {
  @override
  _BichoState createState() => _BichoState();
}

class _BichoState extends State<Bicho> {

  AudioCache _audioCache = AudioCache(prefix: "audios/");

  _executar(String audio) {

    _audioCache.play(audio + ".mp3");

  }

  @override
  void initState() {
    // Precarrega o que for passado aqui na inicialização do app
    super.initState();
    _audioCache.loadAll([
      "cao.mp3", "gato.mp3", "vaca.mp3", "macaco.mp3", "ovelha.mp3", "leao.mp3"
    ]);

  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            _executar("cao");
          },
          child: Image.asset("assets/images/cao.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("gato");
          },
          child: Image.asset("assets/images/gato.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("leao");
          },
          child: Image.asset("assets/images/leao.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("vaca");
          },
          child: Image.asset("assets/images/vaca.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("macaco");
          },
          child: Image.asset("assets/images/macaco.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("ovelha");
          },
          child: Image.asset("assets/images/ovelha.png"),
        )
      ],
    );
  }
}