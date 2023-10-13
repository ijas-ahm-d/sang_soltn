import 'dart:developer';

import 'package:sang/data/network/base_api_service.dart';
import 'package:sang/data/network/network_api_service.dart';
import 'package:sang/features/form/model/hse_observation_model.dart';

class HseObservationRepository {
  BaseApiService apiService = NetWorkApiService();

  Future submitForm({
    required String url,
    required Map body,
  }) async {
    try {
      final response = await apiService.getPostApiResponse(url, body);
      log(response);
      return hseObservationModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
