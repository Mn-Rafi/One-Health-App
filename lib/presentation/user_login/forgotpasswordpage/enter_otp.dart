import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:one_health_app/presentation/user_login/forgotpasswordpage/forgot_password_bloc/forgotpassword_bloc.dart';
import 'package:one_health_app/presentation/user_login/forgotpasswordpage/forgot_password_customwidgets.dart';
import 'package:one_health_app/presentation/user_login/forgotpasswordpage/forgot_password_screen.dart';
import 'package:one_health_app/presentation/user_login/forgotpasswordpage/reset_password.dart';
import 'package:one_health_app/presentation/user_login/loginpage/utilities.dart';
import 'package:one_health_app/utilities.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

class EnterOTP extends StatelessWidget {
  const EnterOTP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotpasswordBloc, ForgotpasswordState>(
      listener: (context, state) {
        if (state is ForgotpasswordNewPasswordState) {
          Navigator.push(
                context,
                PageTransition(
                    duration: const Duration(milliseconds: 600),
                    child: BlocProvider.value(
                      value: context.read<ForgotpasswordBloc>(),
                      child: const ResetPassword(),
                    ),
                    type: PageTransitionType.fade));
        }
        if (state is ForgotpasswordOtpstate) {
          Navigator.pop(context);
        }
      },
      child: const EnterOTPBody(),
    );
  }
}

class EnterOTPBody extends StatelessWidget {
  const EnterOTPBody({
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
                  'Type the Verification Code\nthat we have sent',
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
                  text: 'Enter your Verification Code below.',
                ),
              ),
              ksize3,
              Lottie.asset('assets/LOTTIE/forgotpassword.json', height: 20.h),
              ksize3,
              SlideInLeft(
                delay: const Duration(milliseconds: 400),
                child: const OTPField(),
              ),
              ksize3,
              SlideInLeft(
                delay: const Duration(milliseconds: 400),
                child: GestureDetector(
                  onTap: () {
                    context
                        .read<ForgotpasswordBloc>()
                        .add(ForgotPasswordNewPasswordEvent());
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
                            'Verify Now',
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
                  child: Text(
                    'RESEND OTP',
                    style:
                        GoogleFonts.ubuntu(fontSize: 14.sp, color: Colors.blue),
                  )),
              SizedBox(
                height: 20.h,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    alignment: Alignment.center,
                    width: 20.w,
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
                          'Back',
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
