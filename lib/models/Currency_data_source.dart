import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttercrypto/controller/currencyController.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'Currency.dart';

enum CurrencyColumns {
  id,
  name,
  price,

  oneDayChange,
  oneDayPre,
  marketCap,
}

class CurrencyDataSource extends DataGridSource {
  late List<DataGridRow> _currencies;
  @override
  List<DataGridRow> get rows => _currencies;

  CurrencyDataSource({required List<Currency> currencies}) {
    buildDataGrid(currencies);
  }

  void buildDataGrid(List<Currency> currencies) => _currencies = currencies
      .map<DataGridRow>((currency) => DataGridRow(
          cells: CurrencyColumns.values
              .map((column) => DataGridCell<Currency>(
                    columnName: column.toString(),
                    value: currency,
                  ))
              .toList()))
      .toList();
  @override
  DataGridRowAdapter buildRow(DataGridRow row) => DataGridRowAdapter(
          cells: row.getCells().map<Widget>((dataGridCell) {
        final Currency currency = dataGridCell.value;
        final column = CurrencyColumns.values.firstWhere(
            (element) => element.toString() == dataGridCell.columnName);

        switch (column) {
          case CurrencyColumns.id:
            return buildIdRow(currency);
          case CurrencyColumns.name:
            return buildNameRow(currency.name);
          case CurrencyColumns.price:
            return buildPriceRow(currency);
          case CurrencyColumns.oneDayChange:
            return buildoneDayRow(currency);
          case CurrencyColumns.oneDayPre:
            return buildOneDayPre(currency);
          case CurrencyColumns.marketCap:
            return buildNameRow(currency.marketCap.toString());
            break;
          default:
        }
        return const Text(
          'HEllo',
          style: TextStyle(color: Colors.black),
        );
      }).toList());

  Widget buildIdRow(Currency currency) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildLogo(currency),
          const SizedBox(
            width: 8,
          ),
          Text(
            currency.id,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget buildNameRow(String currency) {
    return Center(
      child: Text(
        currency,
        overflow: TextOverflow.ellipsis,
        style:
            const TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildPriceRow(Currency currency) {
    return Center(
        child: Text(
      "${currency.price}\$",
      style: const TextStyle(color: Colors.tealAccent),
    ));
  }

  Widget buildoneDayRow(Currency currency) {
    final bool isUp = currency.oneDayChange > 0;
    Color? color = isUp ? Colors.green[500] : Colors.red[500];
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Icon(
                isUp ? Icons.arrow_drop_up_sharp : Icons.arrow_drop_down_sharp,
                color: color,
              ),
              Text(
                currency.oneDayChange.toString(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOneDayPre(Currency currency) {
    return Center(
      child: Text(
        "% ${currency.oneDaypre}",
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: currency.oneDayChange > 0 ? Colors.green : Colors.red,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget buildLogo(Currency currency) {
    bool isSvg = currency.logoUrl.endsWith('.svg');
    return CircleAvatar(
        radius: 15,
        child: isSvg
            ? SvgPicture.network(currency.logoUrl)
            : Image.network(currency.logoUrl));
  }
}
