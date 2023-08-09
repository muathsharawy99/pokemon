import 'package:dio/dio.dart';
import 'package:pokemon/view_model/dio_helper/endPoints.dart';

class DioHelper {
  static late Dio dio;

  static void InitDio() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrlWithEndPoint,
      ),
    );
  }

  static Future<Response> get({required String endPoint}) async {
    try {
      var response = await dio.get(endPoint);
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
