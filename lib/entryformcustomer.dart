import 'package:flutter/material.dart';
import 'customer.dart';

// class entryform customer
class EntryForm extends StatefulWidget {
  final Customer item;
  EntryForm(this.item);
  @override
  EntryFormState createState() => EntryFormState(this.item);
}

//class controller
class EntryFormState extends State<EntryForm> {
  Customer customer;
  EntryFormState(this.customer);
  TextEditingController namaController =
      TextEditingController(); //controller nama
  TextEditingController genderController =
      TextEditingController(); //controller gender
  TextEditingController nohpController =
      TextEditingController(); //controller no hp
  TextEditingController alamatController =
      TextEditingController(); //controller alamat
  @override
  Widget build(BuildContext context) {
    //kondisi
    if (customer != null) {
      //jika customer tidak sama dengan null
      namaController.text = customer
          .nama; //nama dari customer dimasukkan ke dalam controller nama
      genderController.text = customer
          .gender; //gender dari customer dimasukkan ke dalam controller gender
      nohpController.text = customer.nohp
          .toString(); //nohp dari customer dimasukkan ke dalam controller no hp
      alamatController.text = customer
          .alamat; //alamat dari customer dimasukkan ke dalam controller alamat
    }
    //rubah
    return Scaffold(
        appBar: AppBar(
          //appBar
          title: customer == null
              ? Text('Tambah')
              : Text(
                  'Ubah'), //Kondisi dimana jika customer sama dengan null maka yang ditampilkan title tambah jika tidak maka sebaliknya
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
                    labelText: 'Nama Customer', //memberikan label
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // gender
              Padding(
                //padding
                padding: EdgeInsets.only(
                    top: 20.0, bottom: 20.0), //mengatur jarak padding
                child: TextField(
                  //textfiled
                  controller:
                      genderController, //mengatur controller yg digunakan
                  keyboardType: TextInputType
                      .text, //menmabahkan keyboard dengan type text
                  decoration: InputDecoration(
                    labelText: 'Gender Customer', //memberikan label
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // no hp
              Padding(
                //padding
                padding: EdgeInsets.only(
                    top: 20.0, bottom: 20.0), //mengatur jarak padding
                child: TextField(
                  //textfield
                  controller: nohpController, //mengatur controller yg digunakan
                  keyboardType: TextInputType
                      .text, //menmabahkan keyboard dengan type text
                  decoration: InputDecoration(
                    labelText: 'No_HP Customer', //memberikan label
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // alamat
              Padding(
                //padding
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  //textfield
                  controller:
                      alamatController, //mengatur controller yg digunakan
                  keyboardType: TextInputType
                      .number, //menmabahkan keyboard dengan type text
                  decoration: InputDecoration(
                    labelText: 'Alamat Customer', //memberikan label
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
                          'Save', //membuat text
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          //kondisi ketika di klik
                          if (customer == null) {
                            //jika customer sama dengan null
                            // maka tambah data
                            customer = Customer(
                              namaController.text,
                              genderController.text,
                              int.parse(nohpController.text),
                              alamatController.text,
                            );
                          } else {
                            //jika customer tidak sama dengan null
                            //maka ubah data
                            customer.nama = namaController.text;
                            customer.gender = genderController.text;
                            customer.nohp = int.parse(nohpController.text);
                            customer.alamat = alamatController.text;
                          }
                          // kembali ke layar sebelumnya dengan membawa objek csutomer
                          Navigator.pop(context, customer);
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
                          'Cancel', //membuat text cancel
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
