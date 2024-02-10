import 'package:changpharma/models/user.dart';

abstract class GetUserStates{}

class GetUserInitial extends GetUserStates{}

class GetUserInProgress extends GetUserStates{}

class GetUserSuccess extends GetUserStates{
  final User user;
  GetUserSuccess(this.user);
}

class GetUserError extends GetUserStates{}