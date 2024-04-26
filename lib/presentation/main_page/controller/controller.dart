import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class MainController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController buttonAnimationController;
  late AnimationController timerAnimationController;

  @override
  void onInit() {
    super.onInit();
    buttonAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    timerAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  Timer? _timer;
  int _secondsElapsed = 0;

  RxString timerData = '00.00.00'.obs;
  RxBool isTimerStarted = false.obs;

  void startTimer() {
    isTimerStarted.value = !isTimerStarted.value;
    if (isTimerStarted.value) {
      buttonAnimationController.stop();
      timerAnimationController.repeat(reverse: true);
      timerData.value = '00.00.00';
      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          _secondsElapsed++;
          int hours = _secondsElapsed ~/ 3600;
          int minutes = (_secondsElapsed % 3600) ~/ 60;
          int seconds = (_secondsElapsed % 60).toInt();
          timerData.value =
              '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
        },
      );
    } else {
      buttonAnimationController.repeat(reverse: true);
      timerAnimationController.stop();
      _timer?.cancel();
      _secondsElapsed = 0;
    }
  }

  @override
  void dispose() {
    super.dispose();
    buttonAnimationController.dispose();
    _timer?.cancel();
  }
}
