
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:one_health_app/presentation/user_login/loginpage/utilities.dart';
import 'package:sizer/sizer.dart';

class PageViewFirst extends StatelessWidget {
  const PageViewFirst({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SlideInLeft(
          delay: const Duration(milliseconds: 400),
          child: Container(
            padding:
                EdgeInsets.fromLTRB(1.h, 0.1.h, 1.h, 0.1.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.green[900]!),
            ),
            child: const TextField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                    color: Color.fromARGB(255, 27, 94, 32)),
                border: InputBorder.none,
                labelText: "First Name",
              ),
            ),
          ),
        ),
        ksize3,
        SlideInLeft(
          delay: const Duration(milliseconds: 400),
          child: Container(
            padding:
                EdgeInsets.fromLTRB(1.h, 0.1.h, 1.h, 0.1.h),
            decoration: kboxDecoration1,
            child: TextField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelStyle:
                    TextStyle(color: Colors.green[900]!),
                border: InputBorder.none,
                labelText: "Last Name",
              ),
            ),
          ),
        ),
        ksize3,
        Row(
          children: [
            SlideInLeft(
              delay: const Duration(milliseconds: 400),
              child: Container(
                width: 40.w,
                padding: EdgeInsets.fromLTRB(
                    1.h, 0.1.h, 1.h, 0.1.h),
                decoration: kboxDecoration1,
                child: TextField(
              textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelStyle:
                        TextStyle(color: Colors.green[900]!),
                    border: InputBorder.none,
                    labelText: "Age",
                  ),
                ),
              ),
            ),
            const Spacer(),
            SlideInLeft(
              delay: const Duration(milliseconds: 400),
              child: Container(
                width: 40.w,
                padding: EdgeInsets.fromLTRB(
                    1.h, 0.1.h, 1.h, 0.1.h),
                decoration: kboxDecoration1,
                child: TextField(
              textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelStyle:
                        TextStyle(color: Colors.green[900]!),
                    border: InputBorder.none,
                    labelText: "Blood Group",
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PageViewSecond extends StatelessWidget {
  const PageViewSecond({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SlideInRight(
          delay: const Duration(milliseconds: 400),
          child: Container(
            padding:
                EdgeInsets.fromLTRB(1.h, 0.1.h, 1.h, 0.1.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.green[900]!),
            ),
            child: const TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                    color: Color.fromARGB(255, 27, 94, 32)),
                border: InputBorder.none,
                labelText: "Email",
              ),
            ),
          ),
        ),
        ksize3,
        SlideInRight(
          delay: const Duration(milliseconds: 400),
          child: Container(
            padding:
                EdgeInsets.fromLTRB(1.h, 0.1.h, 1.h, 0.1.h),
            decoration: kboxDecoration1,
            child: TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelStyle:
                    TextStyle(color: Colors.green[900]!),
                border: InputBorder.none,
                labelText: "Phone Number",
              ),
            ),
          ),
        ),
        ksize3,
        Row(
          children: [
            SlideInRight(
              delay: const Duration(milliseconds: 400),
              child: Container(
                width: 40.w,
                padding: EdgeInsets.fromLTRB(
                    1.h, 0.1.h, 1.h, 0.1.h),
                decoration: kboxDecoration1,
                child: TextField(
                  obscureText: true,
              textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelStyle:
                        TextStyle(color: Colors.green[900]!),
                    border: InputBorder.none,
                    labelText: "Password",
                  ),
                ),
              ),
            ),
            const Spacer(),
            SlideInRight(
              delay: const Duration(milliseconds: 400),
              child: Container(
                width: 40.w,
                padding: EdgeInsets.fromLTRB(
                    1.h, 0.1.h, 1.h, 0.1.h),
                decoration: kboxDecoration1,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelStyle:
                        TextStyle(color: Colors.green[900]!),
                    border: InputBorder.none,
                    labelText: "Confirm Password",
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
