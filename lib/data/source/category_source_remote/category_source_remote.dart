import 'package:flutter_boilerplate/data/model/selected_category_data/selected_category.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import '../../model/category/category_list.dart';

part 'category_source_remote.g.dart';

@RestApi(baseUrl: "https://www.thecocktaildb.com/api/json/v1/1")
abstract class CategoryRestClient {
  factory CategoryRestClient(Dio dio) = _CategoryRestClient;

  @GET("/list.php?c=list")
  Future<Categories> getCategoryList();

  @GET("/filter.php?c={category}")
  Future<SelectedCategory> getSelectedData(@Path("category") String category);
}
