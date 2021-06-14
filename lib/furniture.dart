//class furniture
class Furniture {
  //atribut dari furniture
  int _id; //atribut id
  int get id => this._id; //getter id

  String _nama; //atribut nama
  String get nama => this._nama; //getter nama

  set nama(String value) => this._nama = value; //setter nama

  String _categories; //atribut categories
  String get categories => this._categories; //getter categories

  set categories(String value) => this._categories = value; //setter categories

  String _warna; //atribut warna
  String get warna => this._warna; //getter warna

  set warna(String value) => this._warna = value; //setter warna

  int _harga; //atribut harga
  int get harga => this._harga; //getter harga

  set harga(int value) => this._harga = value; //setter harga

  int _stock; //atribut stock
  int get stock => this._stock; //getter stock

  set stock(int value) => this._stock = value; //setter stock

  //konstruktor versi 1
  Furniture(
      this._nama, this._categories, this._warna, this._harga, this._stock);

  //konstruktor versi 2: konversi dari Map ke Item
  Furniture.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._nama = map['nama'];
    this._categories = map['categories'];
    this._warna = map['warna'];
    this._harga = map['harga'];
    this._stock = map['stock'];
  }

  //konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['nama'] = this._nama;
    map['categories'] = this._categories;
    map['warna'] = this._warna;
    map['harga'] = this._harga;
    map['stock'] = this._stock;
    return map; //mengembalikan nilai dari map
  }
}
