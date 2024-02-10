import 'package:changpharma/utils/utils.dart';
import 'package:dio/dio.dart';

import '../secret.dart';

class ApiClient {
  Future<Response> getOtp(String phoneNumber) async {
    return await getIt
        .get<Dio>()
        .post("$url/v1/otp/generate", data: {'mobileNumber': "91$phoneNumber"});
  }

  Future<Response> verifyOtp(String requestId, String otp) async {
    return await getIt.get<Dio>().post('$url/v1/otp/verify',
        data: {'requestId': requestId, 'code': otp});
  }

  Future<Response> getUser(String phone) async {
    return await getIt.get<Dio>().post('$url/v1/otp/verify');
  }

  Future<Response> post(String url, Map<String, dynamic> body) async {
    return await dio.post(url, data: body);
  }

  Future<Response> put(String url, Map<String, dynamic> body) async {
    return await dio.put(url, data: body);
  }

  Future<Response> delete(String url) async {
    return await dio.delete(url);
  }
}
