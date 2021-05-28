import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pagaination/app/modules/enums/loading_types.dart';
import 'package:test_pagaination/app/modules/home/views/widgets/movie_item.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(() {
        final loadingType = controller.loadingState.value.loadingType;

        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator.adaptive());
        }
        if (controller.moviesList.isEmpty) {
          return Text("No Data");
        }
        return ListView.separated(
          controller: controller.scrollController,
          itemBuilder: (context, index) {
            final isLastItem = index == controller.moviesList.length;

            if (isLastItem && loadingType == LoadingType.loading) {
              return Center(child: CircularProgressIndicator.adaptive());
            } else if (isLastItem && loadingType == LoadingType.error) {
              return Text(controller.loadingState.value.error.toString());
            } else if (isLastItem && loadingType == LoadingType.completed) {
              return Text(controller.loadingState.value.completed.toString());
            } else {
              return MovieItem(controller.moviesList[index]);
            }
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: loadingType == LoadingType.loading ||
                  loadingType == LoadingType.error ||
                  loadingType == LoadingType.completed
              ? controller.moviesList.length + 1
              : controller.moviesList.length,
        );
      }),
    );
  }
}
