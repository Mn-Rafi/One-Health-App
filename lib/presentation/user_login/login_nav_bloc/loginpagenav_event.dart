part of 'loginpagenav_bloc.dart';

@immutable
abstract class LoginpagenavEvent {}

class ForgotPasswordEvent extends LoginpagenavEvent {}

class RegisterEvent extends LoginpagenavEvent {}

class LoginEvent extends LoginpagenavEvent {}