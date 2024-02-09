import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

final dio = getIt.get<Dio>();

setupDep() {
  getIt.registerLazySingleton(() => Dio());
}
