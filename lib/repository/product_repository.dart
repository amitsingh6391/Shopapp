import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/res/store_urls.dart';
import 'package:ecommerce_app/res/string_constants.dart';
import 'package:injectable/injectable.dart';
// import 'package:http/http.dart' as http;

@LazySingleton()
class ProductRepository {
  final Dio _dio = Dio();
  static const int _perPage = 20;

  //fetch products from server with paginanation;

  Future<dynamic> getAllProducts(
    int page,
  ) async {
    print("this is page $page");
    Map<String, int> params = {
      "page": page,
      "perPage": page * _perPage,
    };

    try {
      return await _dio.post(
        StoreUrls.baseUrl,
        options: Options(
          headers: {"token": StringsConstants.authToken},
        ),
        data: jsonEncode(params),
      );
    } catch (e) {
      return e.toString();
    }
  }
}
