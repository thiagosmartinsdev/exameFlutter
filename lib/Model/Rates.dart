import 'dart:collection';

class Rates {
  final String base;
  final DateTime date;
  final LinkedHashMap<String, dynamic> rates;

  Rates({this.base, this.date, this.rates});

  factory Rates.fromJson(Map<String, dynamic> json) {
    return Rates(
      base: json['base'],
      date: DateTime.parse(json["date"]),
      rates: json['rates']
    );
  }





  
}