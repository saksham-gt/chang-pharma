import 'package:changpharma/models/user.dart';
import 'package:changpharma/network/api.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

final dio = getIt.get<Dio>();
final apiClient = getIt.get<ApiClient>();
final sharedPrefs = getIt.get<SharedPreferences>();
User selfUser = User(uid: '', mobile: '');

setupDep() async {
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => ApiClient());
  GetIt.instance.registerLazySingletonAsync<SharedPreferences>(
    () => SharedPreferences.getInstance(),
  );
  await GetIt.instance.isReady<SharedPreferences>();
  // getIt.registerSingleton(() => User(uid: '', mobile: ''));
}
