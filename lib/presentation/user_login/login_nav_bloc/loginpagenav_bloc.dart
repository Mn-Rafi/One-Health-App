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
      emit(LoginpagenavHome());
    });
  }
}
