import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'registerpageview_state.dart';

class RegisterpageviewCubit extends Cubit<RegisterpageviewState> {
  RegisterpageviewCubit() : super(RegisterpageviewInitial());
  void pageChangeStart(){
    emit(RegisterpageviewStart());
  }
  void pageChangeEnd(){
    emit(RegisterpageviewEnd());
  }
}
