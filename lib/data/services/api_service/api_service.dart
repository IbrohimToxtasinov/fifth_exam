import 'package:dio/dio.dart';
import 'package:fifth_exam/data/models/my_response/my_response_model.dart';
import 'package:fifth_exam/data/models/news/news_model.dart';
import 'package:fifth_exam/data/services/api_service/api_client.dart';

class ApiServices extends ApiClient {
  Future<MyResponse> getNews() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response =
      await dio.get("${dio.options.baseUrl}/v5/launches/latest");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = NewsModel.fromJson(response.data);
      }
    } catch (error) {
      myResponse = MyResponse(
        error: error.toString(),
      );
    }
    return myResponse;
  }
}
