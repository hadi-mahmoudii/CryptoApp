import 'package:get/get.dart';

class Currency extends GetxController {
  final String id;
  final String logoUrl;
  final String name;
    dynamic price = 0.0.obs;
  final double oneDayChange;
  final double oneDaypre;
  final int marketCap;

  Currency({
    required this.id,
    required this.logoUrl,
    required this.name,
    required this.price,
    required this.oneDayChange,
    required this.oneDaypre,
    required this.marketCap,
  });

  Currency.fromJson(Map<String, dynamic> json)
      : id = json['symbol'],
        name = json['name'],
        price = json['current_price'],
        logoUrl = json['image'],
        marketCap = json['market_cap'],
        oneDaypre = json["price_change_percentage_24h"],
        oneDayChange = json["price_change_24h"];
}
