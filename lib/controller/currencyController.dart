import 'dart:async';

import 'package:fluttercrypto/Crypto_api.dart';
import 'package:fluttercrypto/models/Currency.dart';
import 'package:fluttercrypto/models/Currency_data_source.dart';
import 'package:get/get.dart';

class CurrencyController extends GetxController {
  CurrencyDataSource? currencyDataSource;
  RxList currencies = <Currency>[].obs;

  CurrencyController() {
    loadCurrencies();
  }

  loadCurrencies() async {
    currencies.value = await CryptoApi.getCurrencies();
    return currencies;
  }
  
  
}
