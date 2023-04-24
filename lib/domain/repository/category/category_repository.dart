import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/domain/usecase/category/category_usecase.dart';

import '../../../core/error/error.dart';
import '../../../data/model/category/category_list.dart';


abstract class CategoryRepository {
  Future<Either<Errr, Categories>> getCategoryList(CategoryParams categoryParams);
}
