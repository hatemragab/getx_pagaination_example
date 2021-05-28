import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:test_pagaination/app/data/movie.dart';

class HomeProvider extends DisposableInterface {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'http://api.themoviedb.org/3/',
      validateStatus: (_) => true,
    ),
  );

  Future<List<Movie>> getData(int page) async {
    final response = await _dio.get(
      'discover/movie',
      queryParameters: {
        'api_key': 'acea91d2bff1c53e6604e4985b6989e2',
        'page': page,
      },
    );

    if (response.statusCode != HttpStatus.ok && response.data != 'success')
      throw response.data['status_message'];
    final dataList = (response.data['results'] as List)
        .map((e) => Movie.fromMap(e))
        .toList();
    return dataList;
  }
}
