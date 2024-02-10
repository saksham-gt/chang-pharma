import 'package:changpharma/models/user.dart';
import 'package:changpharma/network/api.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

final dio = getIt.get<Dio>();
final apiClient = getIt.get<ApiClient>();
final sharedPrefs = getIt.get<SharedPreferences>();
User selfUser = getIt.get<User>();

setupDep() {
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => ApiClient());
  getIt.registerSingleton(()=> SharedPreferences.getInstance());
  getIt.registerSingleton(()=>User(uid: '', mobile: ''));
}
