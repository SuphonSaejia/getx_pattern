import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:neversitup_test/app/data/model/department.dart';
import 'package:neversitup_test/app/data/model/products.dart';

const baseUrl = '659f86b15023b02bfe89c737.mockapi.io';

class ApiClient {
  final http.Client httpClient;
  ApiClient({required this.httpClient});

  Future<List> getDepartment() async {
    try {
      Uri uri = Uri(
        scheme: 'https',
        host: baseUrl,
        path: '/api/v1/departments',
      );
      var response = await httpClient.get(uri);
      if (response.statusCode == 200) {
        List<Department> listDepartmentModel = departmentFromJson(response.body.toString());
        return listDepartmentModel;
      }
      return [];
    } on TimeoutException catch (_) {
      return [];
    } on SocketException catch (_) {
      return [];
    } on Exception catch (_) {
      return [];
    } catch (_) {
      return [];
    }
  }

  Future<List> getProducts({required String id}) async {
    try {
      Uri uri = Uri(
        scheme: 'https',
        host: baseUrl,
        path: '/api/v1/departments/$id/products',
      );

      var response = await httpClient.get(uri);
      if (response.statusCode == 200) {
        List<Product> listProductModel = productFromJson(response.body.toString());
        return listProductModel;
      }
      return [];
    } on TimeoutException catch (_) {
      return [];
    } on SocketException catch (_) {
      return [];
    } on Exception catch (_) {
      return [];
    } catch (_) {
      return [];
    }
  }
}
