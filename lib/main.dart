import 'package:dog_app/Screen/Cart_Screen.dart';
import 'package:dog_app/Screen/History_Screen.dart';
import 'package:dog_app/Screen/Home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dog API App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/history', page: () => HistoryPage()),
        GetPage(name: '/cart', page: () => CartPage()),
      ],
    );
  }
}


