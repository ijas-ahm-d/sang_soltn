import 'dart:developer';

import 'package:sang/data/network/base_api_service.dart';
import 'package:sang/data/network/network_api_service.dart';
import 'package:sang/features/form/model/project_description_model.dart';
import 'package:sang/features/form/model/project_name_model.dart';

class ProjectNameRepository {
  final BaseApiService baseApiService = NetWorkApiService();

  Future<dynamic> getAllProjects(String url) async {
    try {
      final response = await baseApiService.getGetApiResPonse(url: url);
      log("!!!!");
      log(response);
      return projectNameModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future getDescription(String url) async {
    try {
      final response = await baseApiService.getGetApiResPonse(url: url);
      return projectDescriptionModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
