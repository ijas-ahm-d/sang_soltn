import 'dart:convert';
import 'dart:developer';
import 'package:sang/data/app_exceptions.dart';
import 'package:sang/data/network/base_api_service.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetWorkApiService implements BaseApiService {
  @override
  Future getGetApiResPonse({required String url}) async {
    Response? response;
    try {
      response = await http.get(Uri.parse(url));
      log("#######");
      // log(response.body);
      final successResponse = returnResponse(response);
      return successResponse;
    } on SocketException {
      throw "No internet connection";
    } catch (e) {
      log("@@@###");
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future getPostApiResponse(String url, body) async {
    Response? response;
    try {
      var jsonbody = jsonEncode(body);
      response = await http.post(
        Uri.parse(url),
        body: jsonbody,
        // headers: {HttpHeaders.contentTypeHeader: "application/json"},
      );
      var data = returnResponse(response);
      return data;
    } catch (e) {
      rethrow;
    }
  }


  returnResponse(Response response) {
    final jsonBody = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        log("1");
        return response.body;
      case 201:
        log("2");
        return response.body;
      case 400:
        log("3");
        throw BadRequestException(jsonBody["error"]);
      case 401:
        log("4");
        throw UnauthorisedException(jsonBody["message"]);
      case 409:
        log("5");
        throw UnauthorisedException(jsonBody["message"]);
      default:
        log("default");
        throw FetchDataException("Unknown error ${response.statusCode}");
    }
  }
}
