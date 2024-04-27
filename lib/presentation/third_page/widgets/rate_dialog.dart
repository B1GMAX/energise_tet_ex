import 'package:energise_tet_ex/presentation/third_page/controller/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RateDialog extends StatelessWidget {
  const RateDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final thirdController = Get.put(ThirdController());
    return GetBuilder<ThirdController>(
      initState: (state) => thirdController.selectStar(5),
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Rate us'),
        content: Row(
          children: List.generate(
            5,
            (index) => GestureDetector(
              onTap: () => thirdController.selectStar(index),
              child: Icon(
                Icons.star,
                color: thirdController.selectedStarIndex >= index
                    ? Colors.yellow
                    : Colors.grey,
              ),
            ),
          ),
        ),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: Get.back,
            child: const Text('Rate'),
          ),
        ],
      ),
    );
  }
}
