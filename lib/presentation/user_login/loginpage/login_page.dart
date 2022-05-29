import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_health_app/api/login_api/login_api_model.dart';
import 'package:one_health_app/logic/login_api_bloc/apilogin_bloc.dart';
import 'package:one_health_app/logic/login_nav_bloc/loginpagenav_bloc.dart';
import 'package:one_health_app/presentation/home.dart';
import 'package:one_health_app/presentation/user_login/forgotpasswordpage/forgot_password_screen.dart';
import 'package:one_health_app/presentation/user_login/loginpage/login_custom_body.dart';
import 'package:one_health_app/presentation/user_login/loginpage/utilities.dart';
import 'package:one_health_app/presentation/user_login/registerpage/register_screen.dart';
import 'package:one_health_app/presentation/user_login/sign_in_with_otp/otplogin_screen.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  // static User? userDetails;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginpagenavBloc(),
      child: MultiBlocListener(listeners: [
        BlocListener<LoginpagenavBloc, LoginpagenavState>(
          listener: (context, state) {
            if (state is LoginpagenavForgot) {
              Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(milliseconds: 600),
                      child: const ForgotPassword(),
                      type: PageTransitionType.fade));
            }
            if (state is LoginpagenavRegister) {
              Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(milliseconds: 600),
                      child: MultiBlocProvider(
                        providers: [
                          BlocProvider.value(
                              value: context.read<LoginpagenavBloc>()),
                          BlocProvider.value(
                              value: context.read<ApiloginBloc>()),
                        ],
                        child: RegisterScreen(),
                      ),
                      type: PageTransitionType.fade));
            }
            if (state is LoginpagenavHome) {
              context.read<LoginpagenavBloc>().add(LoginSuccessEvent());
            }
            if (state is LoginPageNavtoOTPLoginState) {
              Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(milliseconds: 600),
                      child: BlocProvider.value(
                        value: context.read<LoginpagenavBloc>(),
                        child: const OTPLoginScreen(),
                      ),
                      type: PageTransitionType.fade));
              context
                  .read<LoginpagenavBloc>()
                  .add(LoginPageOtpPopEvent(number: ''));
            }
            if (state is LoginErrorState) {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                  snackBar('Email and password field is required'));
            }
            if (state is LoginEmailErrorState) {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context)
                  .showSnackBar(snackBar('Email is not valid'));
            }
            if (state is LoginPasswordErrorState) {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context)
                  .showSnackBar(snackBar('Password is not valid'));
            }
            if (state is LoginSuccessState) {
              print('API REQUEST SEND');
              context.read<ApiloginBloc>().add(ApiloginStartEvent(
                  email: LoginPageWidget.emailController.text,
                  password: LoginPageWidget.passwordController.text));
            }
          },
        ),
        BlocListener<ApiloginBloc, ApiloginState>(listener: (context, state) {
          if (state is NoInternetState) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBar('No Internet Connection Found'));
          }
          if (state is ApiloginLoadingState) {
            print('LOADINGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG');
          }
          if (state is ApiloginErrorState) {
            print('ERRRRRRRRRRROOOOOOOOORRRRRRR');
          }
          if (state is ApiloginLoadingState) {
            context.read<LoginpagenavBloc>().add(LogingLoadingEvent());
          }
          if (state is ApiloginEndState) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBar('Succesfully logged In'));
            final response = state.response.data["user"];
            print(response);
            print(response["firstName"]);
            // userDetails = User(
            //     id: response["_id"],
            //     firstName: response["firstName"],
            //     secondName: response["secondName"],
            //     age: response["age"],
            //     gender: response["gender"],
            //     email: response["email"],
            //     phone: response["phone"],
            //     blood: response["blood"],
            //     password: response["password"],
            //     image: response["image"],
            //     access: response["access"],
            //     createdAt: DateTime.parse(response["createdAt"]),
            //     updatedAt: DateTime.parse(response["updatedAt"]),
            //     v: response["__v"],
            //     otp: response["otp"]);
            Navigator.pushReplacement(
                context,
                PageTransition(
                    duration: const Duration(milliseconds: 600),
                    child: const HomePage(),
                    type: PageTransitionType.fade));
          }
          if (state is ApiloginErrorState) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(snackBar(state.error));
          }
        })
      ], child: LoginPageWidget()),
    );
  }
}
