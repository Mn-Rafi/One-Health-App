import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:one_health_app/logic/forgot_password_bloc/forgotpassword_bloc.dart';
import 'package:one_health_app/presentation/user_login/forgotpasswordpage/enter_otp.dart';
import 'package:one_health_app/presentation/user_login/loginpage/utilities.dart';
import 'package:one_health_app/utilities.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotpasswordBloc(),
      child: BlocListener<ForgotpasswordBloc, ForgotpasswordState>(
        listener: (context, state) {
          if (state is ForgotpasswordPopstate) {
            Navigator.pop(context);
          }
          if (state is ForgotpasswordOtpstate) {
            Navigator.push(
                context,
                PageTransition(
                    duration: const Duration(milliseconds: 600),
                    child: BlocProvider.value(
                      value: context.read<ForgotpasswordBloc>(),
                      child: const EnterOTP(),
                    ),
                    type: PageTransitionType.fade));
          }
        },
        child: const ForgotPasswordEmailVerification(),
      ),
    );
  }
}

class ForgotPasswordEmailVerification extends StatelessWidget {
  const ForgotPasswordEmailVerification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              ksize7,
              Center(
                child: Text(
                  'Type your email\nto verify your account',
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
                  text: 'Help us to find your Account',
                ),
              ),
              ksize3,
              Lottie.asset('assets/LOTTIE/forgotpassword.json', height: 20.h),
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
              ksize3,
              SlideInLeft(
                delay: const Duration(milliseconds: 400),
                child: GestureDetector(
                  onTap: () {
                    context
                        .read<ForgotpasswordBloc>()
                        .add(ForgotPasswordOTPEvent());
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
                            'Send OTP',
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
              SizedBox(
                height: 25.h,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    alignment: Alignment.center,
                    width: 33.w,
                    height: 4.h,
                    decoration:
                        kboxDecoration1.copyWith(color: Colors.green[900]),
                    child: TextButton.icon(
                        onPressed: () {
                          context
                              .read<ForgotpasswordBloc>()
                              .add(ForgotPasswordPopEvent());
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 18,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Back to login',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
