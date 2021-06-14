import 'package:flutter/material.dart';
import 'furniture.dart';

// class entryform furniture
class EntryForm extends StatefulWidget {
  final Furniture item;
  EntryForm(this.item);
  @override
  EntryFormState createState() => EntryFormState(this.item);
}

//class controller
class EntryFormState extends State<EntryForm> {
  Furniture furniture;
  EntryFormState(this.furniture);
  TextEditingController namaController =
      TextEditingController(); //controller nama
  TextEditingController categoriesController =
      TextEditingController(); //controller categories
  TextEditingController warnaController =
      TextEditingController(); //controller warna
  TextEditingController hargaController =
      TextEditingController(); //controller harga
  TextEditingController stockController =
      TextEditingController(); //controller stock
  @override
  Widget build(BuildContext context) {
    //kondisi
    if (furniture != null) {
      //jika furniture tidak sama dengan null
      namaController.text = furniture
          .nama; //nama dari furniture dimasukkan ke dalam controller nama
      categoriesController.text = furniture
          .categories; //categories dari furniture dimasukkan ke dalam controller categories
      warnaController.text = furniture
          .warna; //warna dari furniture dimasukkan ke dalam controller warna
      hargaController.text = furniture.harga
          .toString(); //harga dari furniture dimasukkan ke dalam controller harga
      stockController.text = furniture.stock
          .toString(); //stock dari furniture dimasukkan ke dalam controller stock
    }
    //rubah
    return Scaffold(
        appBar: AppBar(
          //appBar
          title: furniture == null
              ? Text('Tambah')
              : Text(
                  'Ubah'), //Kondisi dimana jika furniture sama dengan null maka yang ditampilkan title tambah jika tidak maka sebaliknya
          leading: Icon(Icons.keyboard_arrow_left), //menambahkan icon
        ),
        body: Padding(
          //padding
          padding: EdgeInsets.only(
              top: 15.0, left: 10.0, right: 10.0), //mengatur jarak padding
          child: ListView(
            //listview
            children: <Widget>[
              // nama
              Padding(
                //padding
                padding: EdgeInsets.only(
                    top: 20.0, bottom: 20.0), //mengatur jarak padding
                child: TextField(
                  //textfield
                  controller: namaController, //mengatur controller yg digunakan
                  keyboardType: TextInputType
                      .text, //menmabahkan keyboard dengan type text
                  decoration: InputDecoration(
                    labelText: 'Nama Furniture', //memberikan label
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // categories
              Padding(
                //padding
                padding: EdgeInsets.only(
                    top: 20.0, bottom: 20.0), //mengatur jarak padding
                child: TextField(
                  //textfield
                  controller:
                      categoriesController, //mengatur controller yg digunakan
                  keyboardType: TextInputType
                      .text, //menmabahkan keyboard dengan type text
                  decoration: InputDecoration(
                    labelText: 'Categories Furniture', //memberikan label
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // warna
              Padding(
                //padding
                padding: EdgeInsets.only(
                    top: 20.0, bottom: 20.0), //mengatur jarak padding
                child: TextField(
                  //textfield
                  controller:
                      warnaController, //mengatur controller yg digunakan
                  keyboardType: TextInputType
                      .text, //menmabahkan keyboard dengan type text
                  decoration: InputDecoration(
                    labelText: 'Warna yang diinginkan', //memberikan label
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // harga
              Padding(
                //padding
                padding: EdgeInsets.only(
                    top: 20.0, bottom: 20.0), //mengatur jarak padding
                child: TextField(
                  //textfield
                  controller:
                      hargaController, //mengatur controller yg digunakan
                  keyboardType: TextInputType
                      .number, //menmabahkan keyboard dengan type text
                  decoration: InputDecoration(
                    labelText: 'Harga', //memberikan label
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // stock
              Padding(
                //padding
                padding: EdgeInsets.only(
                    top: 20.0, bottom: 20.0), //mengatur jarak padding
                child: TextField(
                  //textfield
                  controller:
                      stockController, //mengatur controller yg digunakan
                  keyboardType: TextInputType
                      .number, //menmabahkan keyboard dengan type number
                  decoration: InputDecoration(
                    labelText: 'Stock', //memberikan label
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // tombol button
              Padding(
                //padding
                padding: EdgeInsets.only(
                    top: 20.0, bottom: 20.0), //mengatur jarak padding
                child: Row(
                  //baris
                  children: <Widget>[
                    // tombol simpan
                    Expanded(
                      child: RaisedButton(
                        //button
                        color: Theme.of(context)
                            .primaryColorDark, //mengatur warna button
                        textColor: Theme.of(context)
                            .primaryColorLight, //mengatur warna text pada button
                        child: Text(
                          'Save', //membuat text save pada button
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          //kondisi ketika di klik
                          if (furniture == null) {
                            //jika furniture sama dengan null
                            // maka tambah data
                            furniture = Furniture(
                                namaController.text,
                                categoriesController.text,
                                warnaController.text,
                                int.parse(hargaController.text),
                                int.parse(stockController.text));
                          } else {
                            //jika furniture tidak sama dengan null
                            //maka ubah data
                            furniture.nama = namaController.text;
                            furniture.categories = categoriesController.text;
                            furniture.warna = warnaController.text;
                            furniture.harga = int.parse(hargaController.text);
                            furniture.stock = int.parse(stockController.text);
                          }
                          // kembali ke layar sebelumnya dengan membawa objek furniture
                          Navigator.pop(context, furniture);
                        },
                      ),
                    ),
                    Container(
                      //container
                      width: 5.0, //mengatur lebar container
                    ),
                    // tombol batal
                    Expanded(
                      child: RaisedButton(
                        //button
                        color: Theme.of(context)
                            .primaryColorDark, //mengatur warna button
                        textColor: Theme.of(context)
                            .primaryColorLight, //mengatur warna text pada button
                        child: Text(
                          'Cancel', //membuat text cancel pada button
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          //kondisi ketika di klik
                          Navigator.pop(
                              context); //kembali ke halaman sebelumnya
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
