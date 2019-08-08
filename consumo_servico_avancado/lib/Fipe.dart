class Fipe {

  int _id;
  int _order;
  String _name;
  String _fipe_name;
  String _key;

  Fipe(this._id, this._order, this._name, this._fipe_name, this._key);

  int get id => _id;

  set id(int id){
    _id = id;
  }
  
  int get order => _order;

  set order(int order){
    _order = order;
  }

  String get name => _name;

  set name(String value){
    _name = value;
  }

  String get fipe_name => _fipe_name;

  set fipe_name(String value){
    _fipe_name = value;
  }

  String get key => _key;

  set key(String value){
    _key = value;
  }
}