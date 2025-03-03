// To parse this JSON data, do
//
//     final sampleGraphQlModel = sampleGraphQlModelFromJson(jsonString);

import 'dart:convert';

SampleGraphQlModel sampleGraphQlModelFromJson(String str) =>
    SampleGraphQlModel.fromJson(json.decode(str));

String sampleGraphQlModelToJson(SampleGraphQlModel data) =>
    json.encode(data.toJson());

class SampleGraphQlModel {
  final Data data;

  SampleGraphQlModel({required this.data});

  factory SampleGraphQlModel.fromJson(Map<String, dynamic> json) =>
      SampleGraphQlModel(data: Data.fromJson(json["data"]));

  Map<String, dynamic> toJson() => {"data": data.toJson()};
}

class Data {
  final List<Country> countries;

  Data({required this.countries});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    countries: List<Country>.from(
      json["countries"].map((x) => Country.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
  };
}

class Country {
  final String code;
  final String name;
  final String emoji;
  final String? capital;
  final String? currency;

  Country({
    required this.code,
    required this.name,
    required this.emoji,
    required this.capital,
    required this.currency,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    code: json["code"],
    name: json["name"],
    emoji: json["emoji"],
    capital: json["capital"],
    currency: json["currency"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
    "emoji": emoji,
    "capital": capital,
    "currency": currency,
  };
}
