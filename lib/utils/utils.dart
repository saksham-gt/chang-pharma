import 'package:changpharma/network/api.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

final dio = getIt.get<Dio>();
final apiClient = getIt.get<ApiClient>();

setupDep() {
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => ApiClient());
}
