//kode utama Aplikasi tampilan awal
import 'package:flutter/material.dart';
import 'homecustomer.dart';
import 'homefurniture.dart';
//package letak folder Anda

void main() => runApp(MyApp());

//class Myapp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //menghilangkan debug show
      title: 'Tambahkan Item Furniture', //menambahkan title
      theme: ThemeData(
        primarySwatch: Colors.teal, //mengatur warna pada appBar
      ),
      home: DefaultTabController(
        //tab controller
        length: 2, //mengatur panjang dari tab controller
        child: Scaffold(
          appBar: AppBar(
            //appBar
            title: Text(
              //menambahkan title pada appBar
              "Toko HomeFurniture",
              style:
                  TextStyle(fontWeight: FontWeight.bold), //mengatur text appBar
            ),
            leading: Icon(Icons.shop_rounded), //menambahkan icon
            bottom: TabBar(
              //tab Bar
              tabs: [
                Tab(
                  text: "Item Furniture", //menambahkan text pada tab bar
                  icon: Icon(
                    //menambhakan icon
                    Icons.add_shopping_cart_rounded,
                    color: Colors.red[300], //mengatur warna icon
                  ),
                ),
                Tab(
                  text: "Customer", //menambahkan text pada tab bar
                  icon: Icon(
                    //menambhakan icon
                    Icons.account_circle_outlined,
                    color: Colors.red[300], //mengatur warna icon
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              HomeFurniture(),
              HomeCustomer(),
            ],
          ),
        ),
      ),
    );
  }
}
