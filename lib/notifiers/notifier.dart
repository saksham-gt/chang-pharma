import 'package:changpharma/notifiers/otp_notifier.dart';
import 'package:changpharma/notifiers/states/get_otp_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getOtpNotifier =
    NotifierProvider<LoginNotifier, OtpStates>(() => LoginNotifier());
