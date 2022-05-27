part of 'loginpagenav_bloc.dart';

@immutable
abstract class LoginpagenavState {}

class LoginpagenavInitial extends LoginpagenavState {}

class LoginpagenavForgot extends LoginpagenavState {}

class LoginpagenavRegister extends LoginpagenavState {}

class LoginpagenavHome extends LoginpagenavState {}

class LoginPagenavResettoLoginState extends LoginpagenavState{}

class LoginPageNavtoOTPLoginState extends LoginpagenavState{}

class LoginPageOtpHomeState extends LoginpagenavState{}

class LoginPageOtpHomeErrorState extends LoginpagenavState{}

class LoginPageOtpnavHomeState extends LoginpagenavState{}

class LoginPagePasswordIconChangeState extends LoginpagenavState{}

class LoginErrorState extends LoginpagenavState{}

class LoginEmailErrorState extends LoginpagenavState{}

class LoginPasswordErrorState extends LoginpagenavState{}


class LoginSuccessState extends LoginpagenavState{}