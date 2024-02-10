import 'package:changpharma/models/default_meal_time.dart';
import 'package:changpharma/notifiers/states/set_reminder_states.dart';
import 'package:changpharma/secret.dart';
import 'package:changpharma/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReminderChangeNotifier extends Notifier<OnReminderStates> {
  @override
  OnReminderStates build() {
    return OnReminderInitialState();
  }

  void set(List<DateTime> reminders) async {

    // api call to set api.
    state = OnReminderChangeInProgress();
    final response = await dio.patch("$url/v1/user/${selfUser.uid}", data: {'breakfastTime': reminders[0].millisecondsSinceEpoch, 'lunchTime': reminders[1].millisecondsSinceEpoch, 'dinnerTime': reminders[2].millisecondsSinceEpoch});
    if(response.statusCode!>=200){
      final data = response.data["defaultTimers"];
      final breakfastTime = DateTime.fromMillisecondsSinceEpoch(data["breakfastTime"]);
      final lunchTime = DateTime.fromMillisecondsSinceEpoch(data["lunchTime"]);
      final dinnerTime = DateTime.fromMillisecondsSinceEpoch(data["dinnerTime"]);
      selfUser.defaultMealTime = DefaultMealTime(breakfast: breakfastTime, lunch:lunchTime, dinner: dinnerTime);
      state = OnReminderChangeSuccess([breakfastTime, lunchTime, dinnerTime]);
    }
   
  }
}

class ToggleReminderNotifier extends Notifier<OnToggleReminderStates>{

  late bool enableReminder;
  @override
  OnToggleReminderStates build() {
    enableReminder = selfUser.enableReminder;
  return OnToggleReminderInitialState();
  }


   toggleReminderState(bool enableReminder) async {
    state = OnToggleReminderInProgress();
    final response = await dio.patch("$url/v1/user/${selfUser.uid}", data: {'enableReminder': !enableReminder});
    if(response.statusCode!>=200){
      selfUser.enableReminder = !enableReminder;
      enableReminder = selfUser.enableReminder;
      state = OnToggleReminderSuccess(selfUser.enableReminder);
    }

  }

}
