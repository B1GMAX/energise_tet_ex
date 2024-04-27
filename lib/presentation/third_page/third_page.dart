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
    final buttonsNames = ['rate_app'.tr, 'share_app'.tr, 'contact_us'.tr];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => ElevatedButton(
          onPressed: () {
            if (index == 0) {
              showCupertinoDialog(
                context: context,
                builder: (context) => const RateDialog(),
              );
            } else if (index == 1) {
              Share.share('check_out_this_app'.tr);
            } else {
              thirdController.openUri();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          child: Text(
            buttonsNames[index],
          ),
        ),
      ),
    );
  }
}
