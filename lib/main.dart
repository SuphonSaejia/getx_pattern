import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:neversitup_test/app/bindings/home_binding.dart';
import 'package:neversitup_test/app/view/home/home_page.dart';
import 'package:neversitup_test/app/view/theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Neversitup Test',
      theme: buildTheme(Brightness.light),
      initialRoute: Routes.home,
      initialBinding: HomeBinding(),
      home: const HomePage(),
    );
  }
}
