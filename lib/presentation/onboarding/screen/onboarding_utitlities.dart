import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:one_health_app/utilities.dart';
import 'package:sizer/sizer.dart';

class OnBoardingLogo extends StatelessWidget {
  const OnBoardingLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 60.h),
      child: Image.asset(
        'images/One Health Logo Splash.png',
        width: 70.w,
      ),
    );
  }
}

class OnBoardingScreenThree extends StatelessWidget {
  const OnBoardingScreenThree({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15.h, width: 100.w),
        Center(
          child: Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                  text: 'Welcome to',
                  style: GoogleFonts.kalam(
                      fontSize: 18.sp, fontWeight: FontWeight.w400),
                ),
                TextSpan(
                  text: '\nOne Health App',
                  style: GoogleFonts.kalam(
                      fontSize: 20.sp,
                      color: Colors.green[900],
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 1.h, width: 100.w),
        Image.asset(
          'images/HospitalPng.png',
          width: 50.w,
        ),
        SizedBox(height: 2.h, width: 100.w),
        Text(
          'An app for your health. \nNow the doctors are on your finger tips.',
          textAlign: TextAlign.center,
          style: GoogleFonts.kalam(
                  fontSize: 15.sp,
                  color: Colors.black,
                ),
        )
      ],
    );
  }
}

class OnBoardingScreenTwo extends StatelessWidget {
  const OnBoardingScreenTwo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: SizedBox(
            width: 100.w,
            child: Center(
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'We Care',
                      style: GoogleFonts.kalam(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '\nAbout Your',
                      style: GoogleFonts.kalam(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' Health',
                      style: GoogleFonts.kalam(
                          fontSize: 18.sp,
                          color: Colors.green[900],
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 65.h,
          ),
          child: Container(
            height: 50.h,
            width: 100.w,
            decoration: BoxDecoration(
                color: Colors.green[300],
                borderRadius: BorderRadius.circular(30.w)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25.h, left: 5.w),
          child: Image.asset(
            'images/We Care.png',
            height: 45.h,
          ),
        ),
        Image.asset(
          'images/CaringPlus.png',
          width: 100.w,
        ),
      ],
    );
  }
}

class OnBoardingScreenOne extends StatelessWidget {
  const OnBoardingScreenOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 63.w, top: 25.h),
          child: Column(
            children: [
              Text(
                'Years',
                style: GoogleFonts.kalam(
                  fontSize: 15.sp,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'of Excellence',
                style: GoogleFonts.kalam(
                  fontSize: 15.sp,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 65.w, top: 10.h),
          child: Iconify(yearsSvg, size: 13.h),
        ),
        Padding(
          padding: EdgeInsets.only(top: 7.h),
          child: Image.asset(
            'images/onboarding1.png',
            height: 70.h,
          ),
        ),
      ],
    );
  }
}
