import 'package:flutter/material.dart';
import 'package:fluttercrypto/CurrenciesWidget.dart';
import 'package:fluttercrypto/MainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      home: 
            MainPAge(),
      
    );
  }
}
