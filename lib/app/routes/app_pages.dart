import 'package:get/get.dart';
import 'package:neversitup_test/app/view/home/home_page.dart';

part './app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
    ),
  ];
}
