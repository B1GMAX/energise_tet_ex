import 'package:energise_tet_ex/presentation/main_page/main_page.dart';
import 'package:energise_tet_ex/presentation/root/controller/controller.dart';
import 'package:energise_tet_ex/presentation/root/widgets/tabs.dart';
import 'package:energise_tet_ex/presentation/second_page/second_page.dart';
import 'package:energise_tet_ex/presentation/third_page/third_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final rootController = Get.put(RootController());
    return Scaffold(
      body: Obx(
        () => Padding(
          padding:const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const Tabs(),
              Expanded(
                child: PageView(
                  controller: rootController.pageController.value,
                  children: const [
                    MainPage(),
                    SecondPage(),
                    ThirdPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
