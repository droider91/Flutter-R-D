import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import '../../model/category/category_list.dart';
part 'category_source_remote.g.dart';

@RestApi(baseUrl: "https://www.thecocktaildb.com/api/json/v1/1")
abstract class CategoryRestClient {
  factory CategoryRestClient(Dio dio) = _CategoryRestClient;
  @GET("/list.php?c=list")
  Future<Categories> getCategoryList();
}

