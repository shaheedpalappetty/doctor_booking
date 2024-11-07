import 'package:astha_agent/src/network/network_service.dart';
import 'package:astha_agent/utils/network_routes.dart';
import 'package:astha_agent/utils/typedef.dart';

class AuthRepo {
  EitherResponse login(Map body) async =>
      ApiService.postApi(ApiUrl.baseUrl + ApiUrl.loginUrl, body);
}
