import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/error/error.dart';
import 'package:flutter_boilerplate/data/model/category/category_list.dart';
import '../../../core/basecase/base_usecase.dart';
import '../../../data/model/selected_category_data/selected_category.dart';
import '../../repository/category/category_repository.dart';
import '../../repository/selected_category/selected_category_repository.dart';

class SelectedCategoryUseCase
    implements BaseUseCase<SelectedCategory, SelectedCategoryParams> {
  late SelectedCategoryRepository selectedCategoryRepository;

  SelectedCategoryUseCase(this.selectedCategoryRepository);

  @override
  Future<Either<Errr, SelectedCategory>> call(SelectedCategoryParams param) async {
    return await selectedCategoryRepository.getSelectedCategoryList(param);
  }
}

class SelectedCategoryParams {
  String categoryName;

  SelectedCategoryParams({required this.categoryName});
}
