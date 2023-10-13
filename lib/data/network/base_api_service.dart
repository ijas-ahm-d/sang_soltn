abstract class BaseApiService {
  Future<dynamic> getPostApiResponse(String url,  body);
  Future<dynamic> getGetApiResPonse({required String url});
}
