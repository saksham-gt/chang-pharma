abstract class OtpStates {}

class OtpInitialState extends OtpStates {}

class OtpGettingState extends OtpStates {}

class OtpGetSuccessState extends OtpStates {
  final String requestId;
  OtpGetSuccessState(this.requestId);
}

class OtpGetErrorState extends OtpStates {
  final String error;

  OtpGetErrorState(this.error);
}

class OtpVerifyingState extends OtpStates {}

class OtpVerifyErrorState extends OtpStates {
  final String error;

  OtpVerifyErrorState(this.error);
}

class OtpVerifySuccessState extends OtpStates {}
