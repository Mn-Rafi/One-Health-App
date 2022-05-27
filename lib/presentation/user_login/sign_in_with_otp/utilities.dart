
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_health_app/presentation/user_login/loginpage/utilities.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

class OTPField extends StatelessWidget {
  const OTPField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      validator: (s) {
        // return s == '2222' ? null : 'Pin is incorrect';
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => print(pin),
    );
  }
}



final defaultPinTheme = PinTheme(
  width: 15.1.w,
  height: 15.1.w,
  textStyle: TextStyle(
      fontSize: 20.sp,
      color: Colors.green[900],
      fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: Colors.green[900]!),
    borderRadius: BorderRadius.circular(10),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: Colors.green[900]!),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration!.copyWith(
    color: const Color.fromRGBO(234, 239, 243, 1),
  ),
);


class OtpNotloggedInbutton extends StatelessWidget {
  const OtpNotloggedInbutton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class OtpLoggedInbutton extends StatelessWidget {
  const OtpLoggedInbutton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      width: 70.w,
      height: 5.h,
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(1.h, 0.1.h, 1.h, 0.1.h),
      decoration: kboxDecoration2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Send OTP',
          textAlign: TextAlign.left,
          style: GoogleFonts.ubuntu(
            fontSize: 11.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
