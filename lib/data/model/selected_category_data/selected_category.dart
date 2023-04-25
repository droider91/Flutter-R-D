import 'drinks.dart';

class SelectedCategory {
  SelectedCategory({
    required  this.drinks,});

  SelectedCategory.fromJson(dynamic json) {
    if (json['drinks'] != null) {
      drinks = [];
      json['drinks'].forEach((v) {
        drinks.add(SelectedDrinks.fromJson(v));
      });
    }
  }
  List<SelectedDrinks> drinks=[];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (drinks != null) {
      map['drinks'] = drinks.map((v) => v.toJson()).toList();
    }
    return map;
  }

}