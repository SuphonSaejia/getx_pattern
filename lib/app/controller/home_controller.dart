import 'package:get/get.dart';
import 'package:neversitup_test/app/data/model/department.dart';
import 'package:neversitup_test/app/data/model/products.dart';
import 'package:neversitup_test/app/data/repository/repository.dart';

class HomeController extends GetxController {
  final Repository repository;
  HomeController({required this.repository});

  final RxInt _index = 0.obs;
  get index => _index.value;
  set index(value) => _index.value = value;

  final RxList<Department> _department = <Department>[].obs;
  List<Department> get department => _department;
  set department(value) => _department.value = value;

  final RxList<Product> _products = <Product>[].obs;
  List<Product> get products => _products;
  set products(value) => _products.value = value;

  @override
  void onInit() {
    getDepartment();
    super.onInit();
  }

  getDepartment() {
    repository.getDepartment().then((data) {
      if (data.isEmpty) return;
      department = data;
      if (department.isNotEmpty) {
        getProducts(id: department.first.id);
      }
    });
  }

  getProducts({required String id}) {
    repository.getProducts(id: id).then((data) {
      if (data.isEmpty) return;
      products = data;
    });
  }
}
