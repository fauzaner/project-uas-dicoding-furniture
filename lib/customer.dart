//class customer
class Customer {
  //atribut dari customer
  int _id; //atribut id
  int get id => this._id; //getter id

  String _nama; //atribut nama
  String get nama => this._nama; //getter nama

  set nama(String value) => this._nama = value; //setter nama

  String _gender; //atribut gender
  String get gender => this._gender; //getter gender

  set gender(String value) => this._gender = value; //setter gender

  int _nohp; //atribut no hp
  int get nohp => this._nohp; //getter no hp

  set nohp(int value) => this._nohp = value; //setter no hp

  String _alamat; //atribut alamat
  String get alamat => this._alamat; //getter alamat

  set alamat(String value) => this._alamat = value; //setter alamat

  //Konstruktor 1
  Customer(this._nama, this._gender, this._nohp, this._alamat);

  //konstruktor versi 2: konversi dari Map ke Item
  Customer.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._nama = map['nama'];
    this._gender = map['gender'];
    this._nohp = map['nohp'];
    this._alamat = map['alamat'];
  }

  //konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['nama'] = this._nama;
    map['gender'] = this._gender;
    map['nohp'] = this._nohp;
    map['alamat'] = this._alamat;
    return map; //mengembalikan nilai dari map
  }
}
