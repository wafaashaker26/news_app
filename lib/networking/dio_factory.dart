import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/news_model.dart';

class DioFactory {
  DioFactory._(); // private constructor

  static Future<List<ArticleModel>> getData(String search) async {
    try {
      final dio = Dio(BaseOptions(baseUrl: 'https://newsapi.org/v2/'));
      final response = await dio.get(
        "everything",
        queryParameters: {
          'q': search,
          'apiKey': '38eb745da82f43ff80e5e95ccb52fdc3',
        },
      );

      Map<String, dynamic> data = response.data;
      NewsModel newsModel = NewsModel.fromJson(data);
      return newsModel.articles;
    } catch (e) {
      debugPrint("Error: $e");
      return [];
    }
  }
}
