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
    } catch (e) {
      state = OtpGetErrorState(e.toString());
    }
  }

  void verifyOtp(String phone, String requestId, String otp)  async {
    state = OtpVerifyingState();
    try {
      final response = await apiClient.verifyOtp(requestId, otp);
      if (response.statusCode == 200) {
        final res =await  apiClient.createUser(phone);
        if(res.statusCode==201){
          final user = response.data as Map<String, dynamic>;
          selfUser.uid = user['userId'];
          selfUser.mobile = user["mobile"];
          selfUser.defaultMealTime = user["breakfast"];
          
        }
        state = OtpVerifySuccessState();
      } else {
        state = OtpVerifyErrorState("Failed to verify OTP");
      }
      Future.delayed(const Duration(seconds: 3)).then(
        (value) => state = OtpVerifySuccessState(),
      );
    } catch (e) {
      state = OtpVerifyErrorState(e.toString());
    }
  }
}
