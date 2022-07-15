import 'package:flutter/material.dart';
import 'package:fluttercrypto/CurrenciesWidget.dart';
import 'package:fluttercrypto/controller/currencyController.dart';

class MainPAge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.refresh),
          focusColor: Colors.blueGrey,
          iconSize: 30,
          onPressed: ()=> CurrencyController().loadCurrencies(),
        ),
        backgroundColor: Colors.black38,
        centerTitle: true,
        title: Text('Crypto App'),
      ),
      body: Container(height: height, width: width, child: CurrenciesWidget()),
    );
  }
}
