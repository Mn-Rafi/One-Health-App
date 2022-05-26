import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'loginpagenav_event.dart';
part 'loginpagenav_state.dart';

class LoginpagenavBloc extends Bloc<LoginpagenavEvent, LoginpagenavState> {
  LoginpagenavBloc() : super(LoginpagenavInitial()) {
    on<ForgotPasswordEvent>((event, emit) {
      emit(LoginpagenavForgot());
    });
    on<RegisterEvent>((event, emit) {
      emit(LoginpagenavRegister());
    });
    on<LoginEvent>((event, emit) {
      if (event.email != '' && event.email != null) {
        emit(LoginpagenavHome());
      } else {
        emit(LoginErrorState());
      }
    });

    on<LoginPagenavResettoLoginEvent>((event, emit) {
      emit(LoginPagenavResettoLoginState());
    });
    on<LoginPageNavtoOTPLoginEvent>((event, emit) {
      emit(LoginPageNavtoOTPLoginState());
    });
    on<LoginPageOtpPopEvent>((event, emit) {
      emit(LoginPageOtpHomeState());
    });
    on<LoginPageOtpnavHomeEvent>((event, emit) {
      emit(LoginPageOtpnavHomeState());
    });
    on<LoginPagePasswordIconChangeEvent>((event, emit) {
      emit(LoginPagePasswordIconChangeState());
    });
  }
}
