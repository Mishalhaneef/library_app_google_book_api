import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:library_api_mvvm/core/constants.dart';
import 'package:library_api_mvvm/network/exceptions.dart';

class NetworkApiService {
  dynamic responseJson;

  Future getApiResponse() async {
    try {
      // fetching data from the url
      final response = await http.get(Uri.parse(apiEndpoint));
  if(response.statusCode == 200 || response.statusCode == 201){
        responseJson = jsonDecode(response.body);
        // log('$responseJson');
  }
      // debugPrint(response.body.toString());
    } on SocketException {
      throw FetchDataException(message: 'No internet connection');
    }
    return responseJson;
  }
}

