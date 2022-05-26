import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_health_app/presentation/home.dart';
import 'package:one_health_app/presentation/user_login/forgotpasswordpage/forgot_password_screen.dart';
import 'package:one_health_app/presentation/user_login/login_nav_bloc/loginpagenav_bloc.dart';
import 'package:one_health_app/presentation/user_login/loginpage/utilities.dart';
import 'package:one_health_app/presentation/user_login/registerpage/register_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginpagenavBloc(),
      child: BlocListener<LoginpagenavBloc, LoginpagenavState>(
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
                      child: const RegisterScreen(),
                      type: PageTransitionType.fade));
            }
            if (state is LoginpagenavHome) {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      duration: const Duration(milliseconds: 600),
                      child: const HomePage(),
                      type: PageTransitionType.fade));
            }
          },
          child: const LoginPageWidget()),
    );
  }
}

class LoginPageWidget extends StatelessWidget {
  const LoginPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 14.w,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: 3.w),
          child: Image.asset('images/logo.png'),
        ),
        title: const Text(
          'One Health Hospital',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ksize7,
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
                  child: const TextField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 27, 94, 32)),
                      border: InputBorder.none,
                      labelText: "Email",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              SlideInLeft(
                delay: const Duration(milliseconds: 400),
                child: Container(
                  padding: EdgeInsets.fromLTRB(1.h, 0.1.h, 1.h, 0.1.h),
                  decoration: kboxDecoration1,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.green[900]!),
                      suffixIcon: GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.visibility_off)),
                      border: InputBorder.none,
                      labelText: "Password",
                    ),
                  ),
                ),
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
              SizedBox(
                height: 3.h,
              ),
              SlideInLeft(
                delay: const Duration(milliseconds: 400),
                child: GestureDetector(
                  onTap: () {
                    context.read<LoginpagenavBloc>().add(LoginEvent());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 70.w,
                        height: 5.h,
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(1.h, 0.1.h, 1.h, 0.1.h),
                        decoration: kboxDecoration1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Sign In',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.ubuntu(
                              fontSize: 11.sp,
                              color: Colors.green[900],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ksize3,
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
