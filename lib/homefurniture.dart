import 'package:flutter/material.dart';
import 'package:project_dicoding_uas/dbhelper.dart';
import 'package:project_dicoding_uas/entryformfurniture.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'furniture.dart'; //pendukung program asinkron

//class home furniture
class HomeFurniture extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

//class home state
class HomeState extends State<HomeFurniture> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Furniture> itemList; //list furniture
  @override
  Widget build(BuildContext context) {
    if (itemList == null) {
      //jiks itemList sama dengan null
      itemList = List<Furniture>(); //menampilkan list
    }
    return Scaffold(
      appBar: AppBar(
        //appBar
        backgroundColor: Colors.teal[100], //mengatur warna background appBar
        title: Text(
          'Daftar Furniture', //membuat text appBaar
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black54), //mengatur text appBar
        ),
        leading: Icon(
          //menambahkan icon
          Icons.list_alt_rounded,
          color: Colors.black87, //mengatur warna icon
        ),
      ),
      body: Column(children: [
        //kolom
        Expanded(
          child: createListView(), //membnggil fungsi createlistView
        ),
        Container(
          //container
          width: 350, //mengatur lebar container
          height: 350, //mengatur tinggi container
          alignment:
              Alignment.bottomCenter, //mengatur aligment pada tengah bawah
          child: SizedBox(
            //sizeBox
            width: double.infinity, //mengatur lebar sizeBox
            child: RaisedButton(
              //button
              child: Text("Tambah Item"), //menambahkan text pada button
              color: Colors.teal[100], //mengatur warna button
              onPressed: () async {
                //ketika button di klik
                var item = await navigateToEntryForm(
                    context, null); //mengarah pada halaman entryformCustomer
                if (item != null) {
                  //kondisi jika item tidak sama dengan null
                  //TODO 2 Panggil Fungsi untuk Insert ke DB
                  int result = await dbHelper
                      .insertFurniture(item); //menambahkan data furniture
                  if (result > 0) {
                    //jika result lebih dari 0
                    updateListView(); //memanggil fungsi udateListView
                  }
                }
              },
            ),
          ),
        ),
      ]),
    );
  }

  Future<Furniture> navigateToEntryForm(
      BuildContext context, Furniture item) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      //mengarah pada halaman entryformfurniture
      return EntryForm(item); //mengembalikan nilai entryform
    }));
    return result; //mengembalikan nilai result
  }

  ListView createListView() {
    TextStyle textStyle =
        Theme.of(context).textTheme.headline5; //mengedit style text
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          //card
          color: Colors.white, //mengatur warna card
          elevation: 2.0,
          child: ListTile(
            //lisrtile
            leading: CircleAvatar(
              backgroundColor:
                  Colors.red, //mengatur warna background circleavatar
              child: Icon(Icons.ad_units), //menambahkan icon
            ),
            title: Text(
              //menambahkan text
              this.itemList[index].nama +
                  "\n" +
                  "Rp." +
                  this.itemList[index].harga.toString(),
              style: textStyle,
            ),
            //menambahkan text
            subtitle: Text(this.itemList[index].categories +
                "\t" +
                "Warna: " +
                this.itemList[index].warna +
                "\n" +
                "Stock: " +
                this.itemList[index].stock.toString()),
            trailing: GestureDetector(
              child: Icon(Icons.delete), //menambahkan icon
              onTap: () async {
                //ketika icon diklik
                //TODO 3 Panggil Fungsi untuk Delete dari DB berdasarkan Item
                int result = await dbHelper.deleteFurniture(this
                    .itemList[index]
                    .id); //mengahpus itemlist berdasarkan index
                if (result > 0) {
                  //jika result lebih fari 0
                  updateListView(); //memanggil method updateListView
                }
              },
            ),
            onTap: () async {
              //ketika card di klik
              var item = await navigateToEntryForm(context,
                  this.itemList[index]); //mengarah ke entryformcfurniture
              //TODO 4 Panggil Fungsi untuk Edit data
              int result = await dbHelper.updateFurniture(
                  item); //melakukan update list berdasarkan index
              if (result > 0) {
                //jika result lebih dari 0
                updateListView(); //memanggil method updateListView
              }
            },
          ),
        );
      },
    );
  }

  //update List item
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      //TODO 1 Select data dari DB
      Future<List<Furniture>> itemListFuture = dbHelper.getFurnitureList();
      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }
}
