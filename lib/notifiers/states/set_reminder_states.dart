abstract class OnReminderStates{}

class OnReminderInitialState extends OnReminderStates{}

class OnReminderChangeInProgress extends OnReminderStates{}

class OnReminderChangeSuccess extends OnReminderStates{
  List<DateTime> changedTimes;
  OnReminderChangeSuccess(this.changedTimes);
}


abstract class OnToggleReminderStates{}
class OnToggleReminderInitialState extends OnToggleReminderStates{}
class OnToggleReminderInProgress extends OnToggleReminderStates{}
class OnToggleReminderSuccess extends OnToggleReminderStates{
  bool enableReminder;
  OnToggleReminderSuccess(this.enableReminder);
}