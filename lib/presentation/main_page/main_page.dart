import 'package:energise_tet_ex/presentation/main_page/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mainController = Get.put(MainController());
    return Center(
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: Tween(begin: 1.0, end: 1.1)
                  .animate(mainController.timerAnimationController),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6),
                  ),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                padding: const EdgeInsets.all(10),
                child: Text(mainController.timerData.value),
              ),
            ),
            const SizedBox(height: 25),
            ScaleTransition(
              scale: Tween(begin: 1.0, end: 1.1)
                  .animate(mainController.buttonAnimationController),
              child: SizedBox(
                height: 100,
                child: ElevatedButton(
                  onPressed: mainController.startTimer,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    !mainController.isTimerStarted.value
                        ? 'play'.tr
                        : 'pause'.tr,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
