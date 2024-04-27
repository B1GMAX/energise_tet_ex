import 'package:energise_tet_ex/presentation/third_page/controller/controller.dart';
import 'package:energise_tet_ex/presentation/third_page/widgets/rate_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    final thirdController = Get.put(ThirdController());
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (index == 0) {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) => const RateDialog(),
                      );
                    } else if (index == 1) {
                      Share.share('check out this app');
                    } else {
                      thirdController.openUri();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    index == 0
                        ? 'Rate App'
                        : (index == 1 ? 'Share App ' : 'Contact us'),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}