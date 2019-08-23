class Video {

  String id;
  String titulo;
  String descricao;
  String imagem;
  String canal;

  Video({this.id, this.titulo, this.descricao, this.imagem, this.canal});

  /*
  * Essa solução resolve o problema, mas não é recomendada
  * Porque a cada execução do método ele cria uma nova instancia
  * Isso significa que a cada execução é alocado um espaço de memória
  * E com isso o consumo de memória é alto
  */
  /*static convertJson(Map<String, dynamic> mapJson){
    return Video(
      id: mapJson["id"]["videoId"],
      titulo: mapJson["snippet"]["title"],
      imagem: mapJson["snippet"]["thumbnails"]["high"]["url"],
      canal: mapJson["snippet"]["channelId"]
    );
  }*/

  /*
  * Esse é forma melhor de se resolver essa situação
  * Pois com essa solução reduzimos a criação de instancia
  * Porque assim é criada uma instacia do objeto apenas uma vez
  */
  factory Video.fromJson(Map<String, dynamic> mapJson) {
     return Video(
        id: mapJson["id"]["videoId"],
        titulo: mapJson["snippet"]["title"],
        imagem: mapJson["snippet"]["thumbnails"]["high"]["url"],
        canal: mapJson["snippet"]["channelTitle"]
     );
  }
}