import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  final pageController = PageController().obs;

  final RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    Get.updateLocale(Get.deviceLocale!);
  }

  void navigateTo(int index) {
    currentIndex.value = index;
    pageController.value.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageController.close();
  }
}
