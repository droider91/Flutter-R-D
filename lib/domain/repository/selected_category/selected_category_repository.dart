import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/domain/usecase/category/category_usecase.dart';

import '../../../core/error/error.dart';
import '../../../data/model/category/category_list.dart';
import '../../../data/model/selected_category_data/selected_category.dart';
import '../../usecase/selected_category/selected_category_usecase.dart';

abstract class SelectedCategoryRepository {
  Future<Either<Errr, SelectedCategory>> getSelectedCategoryList(
      SelectedCategoryParams selectedCategoryParams);
}
