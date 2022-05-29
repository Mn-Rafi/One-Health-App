part of 'apilogin_bloc.dart';

@immutable
 class ApiloginEvent {}

class ApiInitialEvent extends ApiloginEvent {}

class NoInternetEvent extends ApiloginEndEvent {}

class ApiloginStartEvent extends ApiloginEvent {
  final String email;
  final String password;
  ApiloginStartEvent({
    required this.email,
    required this.password,
  });
}

class ApiloginLoadingEvent extends ApiloginEvent {}

class ApiloginEndEvent extends ApiloginEvent {}

class ApiRegisterNew extends ApiloginEvent {
  final String firstName;
  final String secondName;
  final int age;
  final String gender;
  final String email;
  final String phone;
  final String blood;
  final String password;
  final File? image;
  ApiRegisterNew({
    required this.firstName,
    required this.secondName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.blood,
    required this.password,
    required this.image,
  });
}
