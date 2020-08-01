import 'package:dio/dio.dart';

class Http {
  static Future<T> get<T>(String path,
      {Map<String, dynamic> queryParameters, Options options}) async {
    Dio dio = new Dio();

    try {
      Response response = await dio.get<T>(path,
          queryParameters: queryParameters, options: options);
      return response.data;
    } on DioError catch (e) {
      _handleDioException(e);
      return null;
    } on Error catch (e) {
      _handleException(e);
      return null;
    }
  }

  static Future<T> post<T>(String path,
      {Map<String, dynamic> data, Options options}) async {
    Dio dio = new Dio();

    try {
      Response response = await dio.post(path, data: data, options: options);
      return response.data;
    } on DioError catch (e) {
      _handleDioException(e);
      return null;
    } on Error catch (e) {
      _handleException(e);
      return null;
    }
  }

  static void _handleDioException(DioError e) {
    if (e.response != null) {
      print(e.response.data);
      print(e.response.headers);
      print(e.response.request);
    } else {
      print(e.request);
      print(e.message);
    }
  }

  static void _handleException(Error e) {
    print(e.toString());
  }
}
