class SelectedDrinks {
  SelectedDrinks({
    required this.strDrink,
    required this.strDrinkThumb,
    required this.idDrink,
  });

  SelectedDrinks.fromJson(dynamic json) {
    strDrink = json['strDrink'];
    strDrinkThumb = json['strDrinkThumb'];
    idDrink = json['idDrink'];
  }

  String strDrink = '';
  String strDrinkThumb = '';
  String idDrink = '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['strDrink'] = strDrink;
    map['strDrinkThumb'] = strDrinkThumb;
    map['idDrink'] = idDrink;
    return map;
  }
}
