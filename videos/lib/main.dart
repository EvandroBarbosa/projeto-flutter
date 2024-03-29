import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(MaterialApp(
      home: Videos(),
      debugShowCheckedModeBanner: false,
    ));

class Videos extends StatefulWidget {
  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  VideoPlayerController _controller;

  @override
  void initState() {
    //Pré carregamento do contéudo
    super.initState();

    _controller = VideoPlayerController.asset("videos/exemplo.mp4")
      ..initialize().then((_) {
        setState(() {});
      });

    /* _controller = VideoPlayerController.network(
      "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4"
    )..initialize().then( (_) {
       setState(() {
         _controller.play();
       });
    }); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.initialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Text("Aperte o play"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow
        ),
        onPressed: () {
          setState(() {
            _controller.value.isPlaying ? _controller.pause() : _controller.play();
          });
        },
      ),
    );
  }
}
