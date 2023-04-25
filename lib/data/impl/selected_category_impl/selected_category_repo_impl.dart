import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/error/error.dart';
import 'package:flutter_boilerplate/data/model/category/category_list.dart';
import 'package:flutter_boilerplate/domain/repository/selected_category/selected_category_repository.dart';
import 'package:flutter_boilerplate/domain/usecase/selected_category/selected_category_usecase.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../model/selected_category_data/selected_category.dart';
import '../../source/category_source_remote/category_source_remote.dart';
import 'package:dio/dio.dart';


class SelectedCategoryRepositoryImpl implements SelectedCategoryRepository {
  final categoryRestClient = CategoryRestClient(Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    )));

  @override
  Future<Either<Errr, SelectedCategory>> getSelectedCategoryList(SelectedCategoryParams selectedCategoryParams) async {
  var response = await categoryRestClient.getSelectedData(selectedCategoryParams.categoryName);
  return response != null
      ? Right(response)
      : Left(Errr(msg: "Category list is empty"));
  }

}