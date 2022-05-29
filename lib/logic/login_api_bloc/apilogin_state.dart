part of 'apilogin_bloc.dart';

@immutable
abstract class ApiloginState {}

class ApiloginInitial extends ApiloginState {}

class NoInternetState extends ApiloginState {}

class ApiloginStartState extends ApiloginState {}

class ApiloginEndState extends ApiloginState {
  final Response response;
  ApiloginEndState({
    required this.response,
  });
}

class ApiInitialState extends ApiloginState {}

class ApiloginLoadingState extends ApiloginState {}

class ApiloginErrorState extends ApiloginState {
  final String error;
  ApiloginErrorState({
    required this.error,
  });
}

class ApiRegisteNewStartstate extends ApiloginState {}

class ApiRegisteNewENdstate extends ApiloginState {}

class ApiRegisteNewErrorstate extends ApiloginState {
  final String error;
  ApiRegisteNewErrorstate({
    required this.error,
  });
}
