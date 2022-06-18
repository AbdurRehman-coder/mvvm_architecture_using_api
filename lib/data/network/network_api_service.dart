
import 'dart:convert';
import 'dart:io';

import 'package:untitled/data/app_exceptions.dart';
import 'package:untitled/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseAPIService{

  /// GET Response from the server
  /// override method from abstract class [BaseAPIService]
  @override
  Future getApiResponse(String url) async{
    dynamic jsonResponse;
    try{
      http.Response response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    } on SocketException{
      throw FetchDataExceptions('No internet connection');
    }
  }

  /// POST Response from the server
  /// override method from abstract class [BaseAPIService]
  @override
  Future postApiResponse(String url, body) async{
    dynamic jsonResponse;

   http.Response postResponse = await http.post(
     Uri.parse(url),
     body: body,
   );
   /// pass the response to method to process their and return
    ///  the response on successful request from the server
    jsonResponse = returnResponse(postResponse);


  }

  dynamic returnResponse(http.Response response){
    /// switch statement on status code which will be int number
    switch(response.statusCode){
      /// 200 mean request is successful
      case 200:
        /// on successful decode response body and return it
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;

      case 400:
        throw BadRequestException('BadRequestException: ${response.statusCode}');

      case 404:
        throw UnauthorisedException('UnauthorisedException: ${response.statusCode}');

      case 500:
        throw InvalidInputException('InvalidInputException: ${response.statusCode}');

      default:
        throw FetchDataExceptions('Error occurred while communicating with server: ${response.statusCode}');

    }
  }
}