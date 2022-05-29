import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_health_app/logic/login_api_bloc/apilogin_bloc.dart';
import 'package:one_health_app/logic/login_nav_bloc/loginpagenav_bloc.dart';
import 'package:one_health_app/presentation/user_login/loginpage/utilities.dart';
import 'package:sizer/sizer.dart';
import 'package:lottie/lottie.dart';
import 'package:one_health_app/utilities.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class LoginPageWidget extends StatelessWidget {
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();

  LoginPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var iconData = Icons.visibility_off;
    bool isObscure = true;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ksize3,
              Center(
                child: Text(
                  'Hello Guest!\nWelcome to One Health App',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(
                      fontSize: 13.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
              ksize5,
              const Center(
                child: SimpleText(
                  text: 'Before Continue, Please Sign in First.',
                ),
              ),
              ksize3,
              FadeIn(
                delay: const Duration(milliseconds: 400),
                child: Center(
                    child: Lottie.asset('assets/LOTTIE/hospitallogin.json',
                        height: 20.h)),
              ),
              ksize3,
              SlideInLeft(
                delay: const Duration(milliseconds: 400),
                child: Container(
                  padding: EdgeInsets.fromLTRB(1.h, 0.1.h, 1.h, 0.1.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.green[900]!),
                  ),
                  child: TextField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 27, 94, 32)),
                      border: InputBorder.none,
                      labelText: "Email",
                    ),
                  ),
                ),
              ),
              ksize3,
              BlocConsumer<LoginpagenavBloc, LoginpagenavState>(
                listener: (context, state) {
                  if (state is LoginPagePasswordIconChangeState) {
                    if (iconData == Icons.visibility_off) {
                      isObscure = false;
                      iconData = Icons.visibility;
                    } else {
                      isObscure = true;
                      iconData = Icons.visibility_off;
                    }
                  }
                },
                builder: (context, state) {
                  return SlideInLeft(
                    delay: const Duration(milliseconds: 400),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(1.h, 0.1.h, 1.h, 0.1.h),
                      decoration: kboxDecoration1,
                      child: TextField(
                        onSubmitted: (value) {
                          context.read<LoginpagenavBloc>().add(LoginEvent(
                              email: emailController.text,
                              password: passwordController.text));
                        },
                        controller: passwordController,
                        obscureText: isObscure,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.green[900]!),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                context
                                    .read<LoginpagenavBloc>()
                                    .add(LoginPagePasswordIconChangeEvent());
                                context.read<LoginpagenavBloc>().add(LoginEvent(
                                    email: emailController.text,
                                    password: passwordController.text));
                              },
                              child: Icon(iconData)),
                          border: InputBorder.none,
                          labelText: "Password",
                        ),
                      ),
                    ),
                  );
                },
              ),
              ksize1,
              SlideInRight(
                delay: const Duration(milliseconds: 400),
                child: GestureDetector(
                  onTap: () {
                    context.read<LoginpagenavBloc>().add(ForgotPasswordEvent());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SimpleText(
                        text: 'forget password?',
                        color: Colors.blue[900]!,
                      ),
                    ],
                  ),
                ),
              ),
              ksize3,
              SlideInLeft(
                delay: const Duration(milliseconds: 400),
                child: GestureDetector(
                  onTap: () {
                    context.read<LoginpagenavBloc>().add(LoginEvent(
                        email: emailController.text,
                        password: passwordController.text));
                  },
                  child: BlocBuilder<LoginpagenavBloc, LoginpagenavState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          state is LoginSuccessState
                              ? LoggedInbutton()
                              : state is LogingLoadingState
                                  ? state is ApiInitialState
                                      ? LoggedInbutton()
                                      : LoggingInInbutton()
                                  : NotloggedInbutton(),
                        ],
                      );
                    },
                  ),
                ),
              ),
              ksize1,
              SlideInRight(
                delay: const Duration(milliseconds: 400),
                child: const Center(
                  child: SimpleText(
                    text: 'OR',
                    fontSize: 15,
                  ),
                ),
              ),
              ksize1,
              SlideInRight(
                delay: const Duration(milliseconds: 400),
                child: GestureDetector(
                  onTap: () {
                    context
                        .read<LoginpagenavBloc>()
                        .add(LoginPageNavtoOTPLoginEvent());
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SimpleText(
                        text: 'Sign In with OTP',
                        color: Colors.blue[900]!,
                      ),
                    ),
                  ),
                ),
              ),
              ksize1,
              FadeIn(
                delay: const Duration(milliseconds: 400),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SimpleText(text: 'Don’t have an account?'),
                    GestureDetector(
                      onTap: () {
                        context.read<LoginpagenavBloc>().add(RegisterEvent());
                      },
                      child: SimpleText(
                        text: ' tap here',
                        color: Colors.blue[900]!,
                      ),
                    ),
                    const SimpleText(text: ' to register')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
