import 'package:energise_tet_ex/presentation/root/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    final rootController = Get.put(RootController());
    final tabNames = ['main_page'.tr, 'second_page'.tr, 'third_page'.tr];
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (index) => Expanded(
            child: GestureDetector(
              onTap: () => rootController.navigateTo(index),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  border: Border.all(color: Colors.green, width: 3),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                child: Text(
                  tabNames[index],
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
