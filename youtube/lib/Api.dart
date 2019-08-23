import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/model/Video.dart';


const CHAVE_YOUTUBE_API = "AIzaSyDD_Gcw4G3hugBgXJRJySBqWh8E64TgyYI";
const ID_CANAL = "UCgnACLvM9O5lfm9ZBh_d3cg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {

  Future<List<Video>> pesquisar(String pesquisa) async {

    http.Response resp = await http.get(
      URL_BASE + "search"
      "?part=snippet"
      "&type=video"
      "&maxResults=10"
      "&order=date"
      "&key=$CHAVE_YOUTUBE_API"
      "&channelId=$ID_CANAL"
      "&q=$pesquisa"
    );

    if (resp.statusCode == 200) {
      
      Map<String, dynamic> dadosJson = json.decode(resp.body);
      List<Video> videos = dadosJson["items"].map<Video>(
        (map){
          return Video.fromJson(map);
        }
      ).toList();

      return videos;

      //Pra saber que tem varias formas de obter o mesmo resultado
      /*for(var video in dadosJson["items"]){
        print("Resultado: "+ video.toString());
      }*/
//      print("Resultado: "+ dadosJson["items"].toString());

    } else {

    }

  }

}