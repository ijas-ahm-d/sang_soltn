import 'package:sang/data/network/base_api_service.dart';
import 'package:sang/data/network/network_api_service.dart';
import 'package:sang/features/form/model/employee_model.dart';

class EmployeeRepository {
  final BaseApiService baseApiService = NetWorkApiService();

  Future getAllEmployees(String url) async {
    try {
      final response = await baseApiService.getGetApiResPonse(url: url);
      return employeeModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
