import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ThirdController extends GetxController {
  int selectedStarIndex = 5;
  final Uri _url = Uri.parse(
      'https://energise.notion.site/Flutter-f86d340cadb34e9cb1ef092df4e566b7');

  Future<void> openUri() async {
    if (!await launchUrl(_url)) {
      Get.snackbar('Error', 'Could not launch $_url');
    }
  }

  void selectStar(int index) {
    selectedStarIndex = index;
    update();
  }
}
