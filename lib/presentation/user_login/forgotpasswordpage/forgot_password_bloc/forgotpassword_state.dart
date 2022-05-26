part of 'forgotpassword_bloc.dart';

@immutable
abstract class ForgotpasswordState {}

class ForgotpasswordInitial extends ForgotpasswordState {}

class ForgotpasswordPopstate extends ForgotpasswordState {}

class ForgotpasswordOtpstate extends ForgotpasswordState {}

class ForgotpasswordNewPasswordState extends ForgotpasswordState {}

