

 abstract class BaseAPIService {
  /// abstract method for get api response from server
  Future<dynamic> getApiResponse(String url);

  ///abstract method for post api response from server
  Future<dynamic> postApiResponse(String url, dynamic body);

}