import 'package:energise_tet_ex/core/localization/localization.dart';
import 'package:energise_tet_ex/presentation/root/root_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      translationsKeys: AppLocalizations().keys,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en','US'),
      home: const RootPage(),
    );
  }
}
