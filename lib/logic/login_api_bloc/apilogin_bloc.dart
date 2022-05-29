import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import 'package:one_health_app/api/connectivity_services.dart';

part 'apilogin_event.dart';
part 'apilogin_state.dart';

class ApiloginBloc extends Bloc<ApiloginEvent, ApiloginState> {
  final ConnectivityServices _connectivityServices;
  ApiloginBloc(
    this._connectivityServices,
  ) : super(ApiloginInitial()) {
    _connectivityServices.connectivityStream.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        add(NoInternetEvent());
      } else {
        add(ApiInitialEvent());
      }
    });
    on<ApiInitialEvent>((event, emit) {
      emit(ApiInitialState());
    });
    on<NoInternetEvent>((event, emit) {
      emit(NoInternetState());
    });
    on<ApiloginStartEvent>((event, emit) async {
      emit(ApiloginLoadingState());
      try {
        print("Api Request Pending");
        Response response = await loginUser(event.email, event.password);
        print('RESPONSEEEEEEEEEEEEE from Bloc $response');
        if (response.statusCode == 200) {
          print('Verified');
          emit(ApiloginEndState(response: response));
        } else {
          emit(ApiInitialState());
        }
      } catch (e) {
        print('BLOCIL ERRORRRRRRRRRRRRRRRRRRR $e');
        emit(ApiInitialState());
      }
    });

    on<ApiloginEndEvent>((event, emit) {
      emit(ApiloginErrorState(error: 'User id or password invalid'));
    });
    on<ApiRegisterNew>((event, emit) async {
      emit(ApiRegisteNewStartstate());
      try {
        print("Api Request Pending");
        Response response = await registerNewUser(
            age: event.age,
            blood: event.blood,
            email: event.email,
            firstName: event.firstName,
            gender: event.gender,
            image: event.image,
            password: event.password,
            phone: event.phone,
            secondName: event.secondName);
        print('RESPONSEEEEEEEEEEEEE from Bloc $response');
        if (response.statusCode == 201) {
          print('Verified');
          emit(ApiRegisteNewENdstate());
        }
        if (response.statusCode == 409) {
          print('ALREADY EXIST');
        }
      } catch (e) {
        print('BLOCIL ERRORRRRRRRRRRRRRRRRRRR $e');
        emit(
            ApiRegisteNewErrorstate(error: 'Registered Details are not valid'));
      }
    });
  }
  @override
  Future<void> close() {
    _connectivityServices.connectivityStream.stream.listen((event) {}).cancel();
    return super.close();
  }

  Future registerNewUser({
    required String firstName,
    required String secondName,
    required int age,
    required String gender,
    required String email,
    required String phone,
    required String blood,
    required String password,
    required File? image,
  }) async {
    Dio dio = Dio();
    print("Registered Email" + email);

    FormData formData = FormData.fromMap({
      "firstName": firstName,
      "secondName": secondName,
      "age": age,
      "gender": gender,
      "email": email,
      "phone": phone,
      "blood": blood,
      "password": password,
      "cPassword": password,
      // "image": image
    });

    const String registerUrl = 'https://onehealthhospital.online/api/user/';
    Response? response;
    try {
      print('Inside Try');
      response = await dio.post(
        registerUrl,
        data: formData,
      );
      print('RESPONSE  ${response.data}');
    } catch (e) {
      if (e is DioError) {
        print("ERROR IF ANY ${e.response!.data["message"]}");
      } else {
        print("OTHER ERRRRRRRRRRRRROOOOOOOOOOOOOOOORRRRRRRRRRRRRRRR ${e}");
      }
    }
    print("Responseeeeeeeeeeeeeeeeeeeeeeeeeee $response");
    return response;
  }

  Future<Response> loginUser(String email, String password) async {
    Dio dio = Dio();
    var error;

    print("LoginEMAIL" + email);

    const String loginUrl = 'https://onehealthhospital.online/api/user/login/';
    Response? response;
    try {
      response = await dio.post(
        loginUrl,
        data: {
          "email": email,
          "password": password,
        },
      );
      print('RESPONSE  ${response.data}');
    } catch (e) {
      if (e is DioError) {
        error = e.response!.data["message"];
        print("ERROR IF ANY ${e.response!.data["message"]}");
      } else {
        print("OTHER ERRRRRRRRRRRRROOOOOOOOOOOOOOOORRRRRRRRRRRRRRRR ${e}");
      }
    }
    print("Responseeeeeeeeeeeeeeeeeeeeeeeeeee $response");
    return response ?? error;
  }
}
