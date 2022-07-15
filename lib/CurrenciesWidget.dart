import 'package:fluttercrypto/Crypto_api.dart';
import 'package:fluttercrypto/controller/currencyController.dart';
import 'package:fluttercrypto/loading_widget.dart';
import 'package:fluttercrypto/models/Currency.dart';
import 'package:fluttercrypto/models/Currency_data_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CurrenciesWidget extends StatelessWidget {
  CurrencyController currencyController = Get.put(CurrencyController());
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return FutureBuilder(
      future: currencyController.loadCurrencies(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return SfDataGrid(
            defaultColumnWidth: 120,
            frozenColumnsCount: 1,
            columns: buildGridColumns(width),
            source:
                CurrencyDataSource(currencies: snapshot.data as List<Currency>),
          );
        } else {
          return const LoadingWidget(mainFontColor: Colors.black,);
        }
      }),
    );
  }

  List<GridColumn> buildGridColumns(double width) => <GridColumn>[
        GridColumn(
          columnName: CurrencyColumns.id.toString(),
          width: width / 3.5,
          label: buildLable("ID"),
        ),
        GridColumn(
          columnName: CurrencyColumns.name.toString(),
          label: buildLable("Name"),
        ),
        GridColumn(
          columnName: CurrencyColumns.price.toString(),
          label: buildLable("Price"),
        ),
        GridColumn(
          columnName: CurrencyColumns.oneDayChange.toString(),
          label: buildLable("Last 24h"),
        ),
        GridColumn(
          columnName: CurrencyColumns.oneDayPre.toString(),
          label: buildLable("24h%"),
        ),
        GridColumn(
          columnName: CurrencyColumns.marketCap.toString(),
          label: buildLable("Market Cap"),
        ),
      ];

  Widget buildLable(String text) => Center(
          child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ));
}
