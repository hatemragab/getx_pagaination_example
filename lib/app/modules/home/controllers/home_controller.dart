import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_pagaination/app/data/loading_state.dart';
import 'package:test_pagaination/app/data/movie.dart';
import 'package:test_pagaination/app/modules/enums/loading_types.dart';
import 'package:test_pagaination/app/modules/home/providers/home_provider.dart';

class HomeController extends GetxController {
  final moviesList = <Movie>[].obs;
  final _provider = Get.find<HomeProvider>();
  final scrollController = ScrollController();
  int _pageNo = 1;
  final isLoading = true.obs;
  final loadingState = LoadingState(loadingType: LoadingType.stable).obs;

  @override
  void onInit() {
    super.onInit();
    getData();
    scrollController.addListener(_scrollListener);
  }

  void getData() async {
    final listOfData = await _provider.getData(_pageNo);
    moviesList.assignAll(listOfData);
    isLoading.value = false;
  }

  void _scrollListener() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      loadingState.value = LoadingState(loadingType: LoadingType.loading);
      try {
        await Future.delayed(Duration(seconds: 5));
        final listOfData = await _provider.getData(++_pageNo);
        //listOfData.clear();
        if (listOfData.isEmpty) {
          loadingState.value = LoadingState(
              loadingType: LoadingType.completed,
              completed: "there is no data");
        } else {
          moviesList.addAll(listOfData);
          loadingState.value = LoadingState(loadingType: LoadingType.loaded);
        }
      } catch (err) {
        loadingState.value =
            LoadingState(loadingType: LoadingType.error, error: err.toString());
      }
    }
  }
}
