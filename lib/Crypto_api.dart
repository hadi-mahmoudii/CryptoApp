import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fluttercrypto/models/Currency.dart';

import 'package:http/http.dart' as http;

class CryptoApi {
  static const _key = 'edf77bc4e176f7573c069743a666d5eb1c6f5307';

  static Future<List<Currency>> getCurrencies() async {
    const url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';
    final response = await http.get(Uri.parse(url));
    print(response.body);
    final body = json.decode(response.body) as List;

    return body.map((item) => Currency.fromJson(item)).toList();
  }
}
