import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Categories {
  Categories({
     required this.drinks,
  });

  Categories.fromJson(dynamic json) {
    if (json['drinks'] != null) {
      drinks = [];
      json['drinks'].forEach((v) {
        drinks.add(Drinks.fromJson(v));
      });
    }
  }

  late List<Drinks> drinks;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (drinks != null) {
      map['drinks'] = drinks.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Drinks {
  Drinks({
    required this.strCategory,
  });

  Drinks.fromJson(dynamic json) {
    strCategory = json['strCategory'] as String;
  }

  late String strCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['strCategory'] = strCategory as String;
    return map;
  }
}
