import 'package:changpharma/notifiers/states/get_otp_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginNotifier extends Notifier<OtpStates> {
  @override
  OtpStates build() {
    return OtpInitialState();
  }

  void getOtp(String phone) async {
    state = OtpGettingState();
    try {
      // final response = await _apiService.getOtp();
      // if (response.statusCode == 200) {
      //   state = OtpGetSuccessState();
      // } else {
      //   state = OtpGetErrorState("Failed to get OTP");
      // }
      Future.delayed(const Duration(seconds: 3)).then(
        (value) => state = OtpGetSuccessState(),
      );
    } catch (e) {
      state = OtpGetErrorState(e.toString());
    }
  }
}
