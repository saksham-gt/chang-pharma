import 'package:changpharma/notifiers/states/get_otp_states.dart';
import 'package:changpharma/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginNotifier extends Notifier<OtpStates> {
  @override
  OtpStates build() {
    _isOtpSent = false;
    return OtpInitialState();
  }

  late bool _isOtpSent;
  bool get isOtpSent => _isOtpSent;

  reset() {
    _isOtpSent = false;
    state = OtpInitialState();
  }

  void getOtp(String phone) async {
    state = OtpGettingState();
    try {
      final response = await apiClient.getOtp(phone);
      if (response.statusCode == 200) {
        final requestId = (response.data as Map<String, dynamic>)["requestId"];
        final statusCode =
            (response.data as Map<String, dynamic>)["status"] as String;
        statusCode == "OK"
            ? state = OtpGetSuccessState(requestId)
            : state = OtpGetErrorState("Please wait 30 sec before trying");
      } else {
        state = OtpGetErrorState("Failed to get OTP");
      }
      // Future.delayed(const Duration(seconds: 3)).then(
      //   (value) {
      //     _isOtpSent = true;
      //     state = OtpGetSuccessState();
      //   },
      // );
    } catch (e) {
      state = OtpGetErrorState(e.toString());
    }
  }

  void verifyOtp(String requestId, String otp) {
    state = OtpVerifyingState();
    try {
      // final response = await _apiService.verifyOtp();
      // if (response.statusCode == 200) {
      //   state = OtpVerifySuccessState();
      // } else {
      //   state = OtpVerifyErrorState("Failed to verify OTP");
      // }
      Future.delayed(const Duration(seconds: 3)).then(
        (value) => state = OtpVerifySuccessState(),
      );
    } catch (e) {
      state = OtpVerifyErrorState(e.toString());
    }
  }
}
