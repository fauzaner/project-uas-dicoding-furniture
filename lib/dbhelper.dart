import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'customer.dart';
import 'furniture.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();
  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'homeFurniture.db';
    //create, read databases
    var itemDatabase = openDatabase(path, version: 4, onCreate: _createDb);
    //mengembalikan nilai object sebagai hasil dari fungsinya
    return itemDatabase;
  }

  //buat tabel baru dengan nama mobil
  void _createDb(Database db, int version) async {
    //tabel furniture
    await db.execute('''
 CREATE TABLE furniture (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT,
        categories TEXT,
        warna TEXT,
        harga INTEGER,
        stock INTEGER
      )
    ''');
    //tabel customer
    await db.execute('''
      CREATE TABLE customer (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT,
        gender TEXT,
        no_hp INTEGER,
        alamat TEXT
      )
    ''');
  }

  //select furniture databases
  Future<List<Map<String, dynamic>>> selectFurniture() async {
    Database db = await this.initDb();
    var mapList = await db.query('furniture', orderBy: 'nama');
    return mapList;
  }

  //select customer databases
  Future<List<Map<String, dynamic>>> selectCustomer() async {
    Database db = await this.initDb();
    var mapList = await db.query('customer', orderBy: 'nama');
    return mapList;
  }

  //insert furniture databases
  Future<int> insertFurniture(Furniture object) async {
    Database db = await this.initDb();
    int count = await db.insert('furniture', object.toMap());
    return count;
  }

  //insert customer databases
  Future<int> insertCustomer(Customer object) async {
    Database db = await this.initDb();
    int count = await db.insert('customer', object.toMap());
    return count;
  }

  //update furniture databases
  Future<int> updateFurniture(Furniture object) async {
    Database db = await this.initDb();
    int count = await db.update('furniture', object.toMap(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

  //update customer databases
  Future<int> updateCustomer(Customer object) async {
    Database db = await this.initDb();
    int count = await db.update('customer', object.toMap(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

  //delete furniture databases
  Future<int> deleteFurniture(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('furniture', where: 'id=?', whereArgs: [id]);
    return count;
  }

  //delete customer databases
  Future<int> deleteCustomer(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('customer', where: 'id=?', whereArgs: [id]);
    return count;
  }

  //list furniture
  Future<List<Furniture>> getFurnitureList() async {
    var furnitureMapList = await selectFurniture();
    int count = furnitureMapList.length;
    List<Furniture> furnitureList = List<Furniture>();
    for (int i = 0; i < count; i++) {
      furnitureList.add(Furniture.fromMap(furnitureMapList[i]));
    }
    return furnitureList;
  }

  //list customer
  Future<List<Customer>> getCustomerList() async {
    var customerMapList = await selectCustomer();
    int count = customerMapList.length;
    List<Customer> customerList = List<Customer>();
    for (int i = 0; i < count; i++) {
      customerList.add(Customer.fromMap(customerMapList[i]));
    }
    return customerList;
  }

  factory DbHelper() {
    //kondisi jika dbhelper sama dengan null
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper; //mengembalikan nilai dari dbhelper
  }
  Future<Database> get database async {
    //kondisi jika database sama dengan null
    if (_database == null) {
      _database = await initDb();
    }
    return _database; //mengembalikan nilai dari database
  }
}
