// ignore_for_file: camel_case_types

import 'package:dio/dio.dart';

class Dio_Helper {
  static Dio? dio;

  static init(){
   dio = Dio(
      BaseOptions(
          baseUrl: 'https://newsapi.org/', receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> getData(
      {required String url, required Map<String, dynamic> query}) async {
    return await dio!.get(url, queryParameters: query);
  }
}
