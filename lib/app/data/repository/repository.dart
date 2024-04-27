import 'package:neversitup_test/app/data/provider/api.dart';

class Repository {
  final ApiClient apiClient;

  Repository({required this.apiClient});

  Future getDepartment() {
    return apiClient.getDepartment();
  }

  Future getProducts({required String id}) {
    return apiClient.getProducts(id: id);
  }
}
