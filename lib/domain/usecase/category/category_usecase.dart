import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/error/error.dart';
import 'package:flutter_boilerplate/data/model/category/category_list.dart';
import '../../../core/basecase/base_usecase.dart';
import '../../repository/category/category_repository.dart';

class CategoryUseCase implements BaseUseCase<Categories, CategoryParams> {
  late CategoryRepository categoryRepository;

  CategoryUseCase(this.categoryRepository);

  @override
  Future<Either<Errr, Categories>> call(CategoryParams param) async {
    return await categoryRepository.getCategoryList(param);
  }

 /* @override
  Future<Either<Errr, Categories>> call(CategoryParams categoryParams) async {
    return await categoryRepository.getCategoryList(categoryParams);
  }*/
}

class CategoryParams {
  String categoryName;
  CategoryParams({required this.categoryName});
}
