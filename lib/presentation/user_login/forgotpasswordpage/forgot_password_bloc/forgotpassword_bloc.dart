import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'forgotpassword_event.dart';
part 'forgotpassword_state.dart';

class ForgotpasswordBloc
    extends Bloc<ForgotpasswordEvent, ForgotpasswordState> {
  ForgotpasswordBloc() : super(ForgotpasswordInitial()) {
    on<ForgotPasswordPopEvent>((event, emit) {
      emit(ForgotpasswordPopstate());
    });
    on<ForgotPasswordOTPEvent>((event, emit) {
      emit(ForgotpasswordOtpstate());
    });
    on<ForgotPasswordNewPasswordEvent>((event, emit) {
      emit(ForgotpasswordNewPasswordState());
    });
  }
}
