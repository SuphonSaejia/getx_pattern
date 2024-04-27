import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:neversitup_test/app/controller/home_controller.dart';
import 'package:neversitup_test/app/data/provider/api.dart';

import '../data/repository/repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController(
        repository: Repository(
          apiClient: ApiClient(
            httpClient: http.Client(),
          ),
        ),
      );
    });
  }
}
