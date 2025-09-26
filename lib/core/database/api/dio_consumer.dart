import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'api_consumer.dart';
import 'app_interceptor.dart';
import 'end_points.dart';

@Injectable(as: ApiConsumer)
class DioConsumer extends ApiConsumer {
  final Dio dio;

  @factoryMethod
  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseURL;
    dio.interceptors.add(AppInterceptor());
  }

  @override
  Future get(String path, {Object? data, Map<String, dynamic>? queryParameters}) async {
    final res = await dio.get(path, data: data, queryParameters: queryParameters);
    return res.data;
  }

  @override
  Future post(String path, {dynamic data, Map<String, dynamic>? queryParameters, bool isFormData = false}) async {
    final res = await dio.post(path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters);
    return res.data;
  }

  @override
  Future patch(String path, {dynamic data, Map<String, dynamic>? queryParameters, bool isFormData = false}) async {
    final res = await dio.patch(path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters);
    return res.data;
  }

  @override
  Future delete(String path, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    final res = await dio.delete(path, data: data, queryParameters: queryParameters);
    return res.data;
  }
}
