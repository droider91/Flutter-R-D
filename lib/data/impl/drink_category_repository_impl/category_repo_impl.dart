import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/error/error.dart';
import 'package:flutter_boilerplate/data/model/category/category_list.dart';
import 'package:flutter_boilerplate/data/source/category_source_remote/category_source_remote.dart';
import 'package:flutter_boilerplate/domain/repository/category/category_repository.dart';
import 'package:flutter_boilerplate/domain/usecase/category/category_usecase.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'entity/drinks/drink_model.dart';

class CategoryRepoImpl implements CategoryRepository {
  final categoryRestClient = CategoryRestClient(Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    )));

  @override
  Future<Either<Errr, Categories>> getCategoryList(
      CategoryParams categoryParams) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      print("not connected");
      var openedBox = await Hive.openBox<DrinkEntity>('my_drinks');
      List<DrinkEntity> _inventoryList = openedBox.values.toList();
      print('data list: $_inventoryList');
      var listOfDrinkModel = _inventoryList
          .map((e) => Drinks(strCategory: e.strCategory))
          .toList();
      return Right(Categories(drinks: listOfDrinkModel));
    } else {
      print("connected");
      final response = await categoryRestClient.getCategoryList();
      var drinkCategoryBox = await Hive.openBox<DrinkEntity>('my_drinks');
      var listOfDrink = response.drinks
          .map((e) => DrinkEntity(strCategory: e.strCategory))
          .toList();
      drinkCategoryBox.addAll(listOfDrink);
      drinkCategoryBox.close();

      return response.drinks != null
          ? Right(response)
          : Left(Errr(msg: "Category list is empty"));
    }
  }
}
