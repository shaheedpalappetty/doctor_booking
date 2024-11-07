import 'dart:convert';
import 'dart:io';
import 'package:astha_agent/utils/app_exception.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:astha_agent/utils/typedef.dart';

class ApiService {
  static final Map<String, String> _header = {
    'Content-Type': 'application/json',
    'Authorization': ''
  };

  //post method
  static EitherResponse postApi(String url, Map map, [String? token]) async {
    final uri = Uri.parse(url);
    final body = jsonEncode(map);

    if (token != null) {
      _header['Authorization'] = token;
    }

    try {
      final response = await http.post(uri, body: body, headers: _header);
      dynamic fetchedData = _getResponse(response);
      return Right(fetchedData);
    } on SocketException {
      return Left(InternetException());
    } on http.ClientException {
      return Left(RequestTimeOutException());
    } on AppException catch (e) {
      return Left(e);
    }
  }

  //get Method
  static EitherResponse getApi(String url, [String? token]) async {
    final uri = Uri.parse(url);
    if (token != null) {
      _header['Authorization'] = token;
    }

    try {
      final response = await http.get(uri, headers: _header);
      dynamic fetchedData = _getResponse(response);
      return Right(fetchedData);
    } on SocketException {
      return Left(InternetException());
    } on http.ClientException {
      return Left(RequestTimeOutException());
    } on AppException catch (e) {
      return Left(e);
    }
  }


//
  static _getResponse(http.Response response) {
    final responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return responseBody;
    } else {
      final errorMessage = responseBody['message'] ?? 'An error occurred';
      throw BadRequestException(errorMessage);
    }
  }
}
