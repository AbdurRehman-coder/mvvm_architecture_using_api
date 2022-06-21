
import 'package:untitled/data/network/base_api_service.dart';
import 'package:untitled/data/network/network_api_service.dart';
import 'package:untitled/resources/app_url.dart';

class AuthRepository{
  /// Create instance of abstract class which we instantiated with its child class
  final BaseAPIService _apiService = NetworkApiService();
  
  Future<dynamic> postApi(dynamic body) async{
    final apiResponse = _apiService.postApiResponse(AppURLs.loginUrl, body);
    return apiResponse;
  }
}