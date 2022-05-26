part of 'forgotpassword_bloc.dart';

@immutable
abstract class ForgotpasswordEvent {}

class ForgotPasswordPopEvent extends ForgotpasswordEvent{}

class ForgotPasswordOTPEvent extends ForgotpasswordEvent{}

class ForgotPasswordNewPasswordEvent extends ForgotpasswordEvent{}