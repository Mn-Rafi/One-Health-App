import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'loginpagenav_event.dart';
part 'loginpagenav_state.dart';

class LoginpagenavBloc extends Bloc<LoginpagenavEvent, LoginpagenavState> {
  LoginpagenavBloc() : super(LoginpagenavInitial()) {
    int validationCount = 0;
    bool emailValid(String email) {
      bool emailValid =
          RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
              .hasMatch(email);
      return emailValid;
    }

    RegExp passwordValid =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    on<ForgotPasswordEvent>((event, emit) {
      emit(LoginpagenavForgot());
    });
    on<RegisterEvent>((event, emit) {
      emit(LoginpagenavRegister());
    });
    on<LoginEvent>((event, emit) {
      if (event.email != '' &&
          event.email != null &&
          event.password != '' &&
          event.password != null) {
        if (emailValid(event.email!)) {
          if (passwordValid.hasMatch(event.password!)) {
            emit(LoginpagenavHome());
          } else {
            emit(LoginPasswordErrorState());
          }
        } else {
          emit(LoginEmailErrorState());
        }
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
      if (event.number!.length == 10) {
        emit(LoginPageOtpHomeState());
      } else {
        emit(LoginPageOtpHomeErrorState());
      }
    });
    on<LoginPageOtpnavHomeEvent>((event, emit) {
      emit(LoginPageOtpnavHomeState());
    });
    on<LoginPagePasswordIconChangeEvent>((event, emit) {
      emit(LoginPagePasswordIconChangeState());
    });
    on<LoginSuccessEvent>((event, emit) {
      emit(LoginSuccessState());
    });
    on<LogingLoadingEvent>((event, emit) => {emit(LogingLoadingState())});
  }
}
