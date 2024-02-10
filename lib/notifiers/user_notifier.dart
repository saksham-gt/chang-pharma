import 'dart:convert';

import 'package:changpharma/models/default_meal_time.dart';
import 'package:changpharma/models/user.dart';
import 'package:changpharma/notifiers/states/get_user_states.dart';
import 'package:changpharma/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetUserDataNotifier extends Notifier<GetUserStates> {
  @override
  GetUserStates build() {
    return GetUserInitial();
  }

  void getUserByNumber(String phone) async {
    final ph = phone.trim();
    state = GetUserInProgress();
    final data = (await apiClient.getUserByNumber(ph)).data;
    final localUser = User(uid: data["uid"] as String, name: data["name"] as String, age: data["age"] as int, mobile: data["mobile"] as String, defaultMealTime: DefaultMealTime.fromJson((json.encode(data["defaultMealTime"])),),);
    selfUser = localUser;
    state = GetUserSuccess(localUser);
  }
}
