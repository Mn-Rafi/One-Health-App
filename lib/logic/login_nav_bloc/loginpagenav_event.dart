part of 'loginpagenav_bloc.dart';

@immutable
abstract class LoginpagenavEvent {}

class ForgotPasswordEvent extends LoginpagenavEvent {}

class RegisterEvent extends LoginpagenavEvent {}

class LoginEvent extends LoginpagenavEvent {
  final String? email;
  final String? password;
  LoginEvent({
    required this.email,
    required this.password,
  });
}

class LoginPagenavResettoLoginEvent extends LoginpagenavEvent {}

class LoginPageNavtoOTPLoginEvent extends LoginpagenavEvent {}

class LoginPageOtpPopEvent extends LoginpagenavEvent {
  final String? number;
  LoginPageOtpPopEvent({
    required this.number,
  });
}

class LoginPageOtpnavHomeEvent extends LoginpagenavEvent {}

class LoginPagePasswordIconChangeEvent extends LoginpagenavEvent {}

class LoginSuccessEvent extends LoginpagenavEvent{}
