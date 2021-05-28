import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pagaination/app/data/movie.dart';
import 'package:test_pagaination/app/modules/home/controllers/home_controller.dart';

class MovieItem extends GetView<HomeController> {
  final Movie movie;

  MovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(movie.poster.toString()),
      title: Text(movie.title.toString()),
      subtitle: Text(movie.overview.toString()),
      trailing: Text(movie.date.toString()),
    );
  }
}
