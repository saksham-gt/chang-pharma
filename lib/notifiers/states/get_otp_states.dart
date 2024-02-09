abstract class OtpStates {}

class OtpInitialState extends OtpStates {}

class OtpGettingState extends OtpStates {}

class OtpGetSuccessState extends OtpStates {}

class OtpGetErrorState extends OtpStates {
  final String error;

  OtpGetErrorState(this.error);
}
