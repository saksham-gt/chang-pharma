import 'package:changpharma/notifiers/states/set_reminder_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SetReminderNotifier extends Notifier<OnSetReminderStates> {
  @override
  OnSetReminderStates build() {
    return OnSetReminderInitialState();
  }

  set(List<DateTime?> reminders) async {
    List<DateTime?> _rem = reminders.where((e) => e != null).toList();

    // api call to set api.
    state = OnSetReminderInProgress();
    Future.delayed(
      const Duration(seconds: 2),
    ).then(
      (value) => state = OnSetReminderSuccess(),
    );
  }
}
