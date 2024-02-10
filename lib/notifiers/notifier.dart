import 'package:changpharma/notifiers/otp_notifier.dart';
import 'package:changpharma/notifiers/set_reminder_notifier.dart';
import 'package:changpharma/notifiers/states/get_otp_states.dart';
import 'package:changpharma/notifiers/states/get_user_states.dart';
import 'package:changpharma/notifiers/states/set_reminder_states.dart';
import 'package:changpharma/notifiers/user_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getOtpNotifier =
    NotifierProvider<LoginNotifier, OtpStates>(() => LoginNotifier(),);

final setReminderNotifier = NotifierProvider<ReminderChangeNotifier, OnReminderStates>(()=>ReminderChangeNotifier(),);

final getUserNotifier = NotifierProvider<GetUserDataNotifier, GetUserStates>(()=>GetUserDataNotifier());


final toggleReminderNotifier = NotifierProvider<ToggleReminderNotifier, OnToggleReminderStates>(()=>ToggleReminderNotifier());