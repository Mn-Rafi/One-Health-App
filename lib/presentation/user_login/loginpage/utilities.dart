import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SimpleText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  const SimpleText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 11,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: GoogleFonts.ubuntu(
        fontSize: fontSize.sp,
        color: color,
      ),
    );
  }
}

final ksize1 = SizedBox(
  height: 1.h,
);

final ksize3 = SizedBox(
  height: 3.h,
);

final ksize5 = SizedBox(
  height: 5.h,
);

final ksize7 = SizedBox(
  height: 7.h,
);

final ksize10 = SizedBox(
  height: 10.h,
);

final kboxDecoration1 = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    border: Border.all(color: Colors.green[900]!));

final kboxDecoration2 = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color: Colors.green[900]!,
    border: Border.all(color: Colors.white));

SnackBar snackBar(String text) => SnackBar(
      content: Text(text),
      duration: const Duration(milliseconds: 2000),
    );

class NotloggedInbutton extends StatelessWidget {
  const NotloggedInbutton({
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
          'Sign In',
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

class LoggedInbutton extends StatelessWidget {
  const LoggedInbutton({
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
          'Sign In',
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

class LoggingInInbutton extends StatelessWidget {
  const LoggingInInbutton({
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
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
