import 'package:get/get.dart';
import 'package:test_pagaination/app/modules/home/providers/home_provider.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeProvider>(
      HomeProvider(),
    );

    Get.put<HomeController>(
      HomeController(),
    );
  }
}
