import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache(prefix: "audio/");
  bool primeraExecucao = true;
  double _volume = 0.5;

  _execultarPlay() async {

    audioPlayer.setVolume(_volume);

    if (primeraExecucao) {
      audioPlayer = await audioCache.play("Quebrantado.mp3");
      primeraExecucao = false;
    } else {
      audioPlayer.resume();
    }

    /* String url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-9.mp3";
    int resultado =  await audioPlayer.play(url);

    if(resultado == 1){
      //sucesso
    } */

  }

  _parar() async {
    int resultado = await audioPlayer.stop();
    if(resultado == 1){
      //sucesso
    }
  }

  _pausar() async {
    int resultado = await audioPlayer.pause();
    if(resultado == 1){
      //sucesso
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Sons"),
      ),
      body: Column(
        children: <Widget>[
         Slider(
           value: _volume,
           min: 0,
           max: 1,
           divisions: 10,
           onChanged: (value){
             setState(() {
               _volume = value;
             });
             audioPlayer.setVolume(value);
           },
         ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/images/executar.png"),
                  onTap: () {
                    _execultarPlay();
                  },
                )
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/images/pausar.png"),
                  onTap: (){
                    _pausar();
                  },
                )
              ),
               Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/images/parar.png"),
                  onTap: (){
                    _parar();
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}


