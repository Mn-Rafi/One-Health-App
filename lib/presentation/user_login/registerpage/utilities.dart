import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_health_app/logic/register_page_view.dart_cubit/registerpageview_cubit.dart';
import 'package:sizer/sizer.dart';

import 'package:one_health_app/presentation/user_login/loginpage/utilities.dart';

var items = [
  'A Positive',
  'O Positive',
  'B Positive',
  'AB Positive',
  'A Negative',
  'O Negative',
  'B Negative',
  'AB Negative',
];
String dropdownvalue = 'A Positive';

class PageViewFirst extends StatelessWidget {
  final BuildContext ctxt;
  const PageViewFirst({
    Key? key,
    required this.ctxt,
  }) : super(key: key);

  static TextEditingController firstNameController = TextEditingController();
  static TextEditingController lastNameController = TextEditingController();
  static TextEditingController ageController = TextEditingController();
  static TextEditingController bloodgroupController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SlideInLeft(
          delay: const Duration(milliseconds: 100),
          child: Container(
            padding: EdgeInsets.fromLTRB(1.h, 0.1.h, 1.h, 0.1.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.green[900]!),
            ),
            child: TextField(
              controller: firstNameController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Color.fromARGB(255, 27, 94, 32)),
                border: InputBorder.none,
                labelText: "First Name",
              ),
            ),
          ),
        ),
        ksize3,
        SlideInLeft(
          delay: const Duration(milliseconds: 100),
          child: Container(
            padding: EdgeInsets.fromLTRB(1.h, 0.1.h, 1.h, 0.1.h),
            decoration: kboxDecoration1,
            child: TextField(
              controller: lastNameController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.green[900]!),
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
              delay: const Duration(milliseconds: 100),
              child: Container(
                width: 40.w,
                padding: EdgeInsets.fromLTRB(1.h, 0.1.h, 1.h, 0.1.h),
                decoration: kboxDecoration1,
                child: TextField(
                  controller: ageController,
                  enableInteractiveSelection: false,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.green[900]!),
                    border: InputBorder.none,
                    labelText: "Age",
                  ),
                ),
              ),
            ),
            const Spacer(),
            SlideInLeft(
              delay: const Duration(milliseconds: 100),
              child: Container(
                height: 7.h,
                width: 40.w,
                padding: EdgeInsets.fromLTRB(1.h, 0.1.h, 1.h, 0.1.h),
                decoration: kboxDecoration1,
                child: Center(
                  child: Stack(
                    children: [
                      Text(
                        'Blood Group',
                        style: GoogleFonts.ubuntu(
                            fontSize: 8.sp, color: Colors.green[900]),
                      ),
                      BlocBuilder<RegisterpageviewCubit, RegisterpageviewState>(
                        builder: (context, state) {
                          return DropdownButton<String>(
                            underline: const SizedBox(),
                            style: TextStyle(color: Colors.green[900]),
                            value: dropdownvalue,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.green[900],
                            ),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              dropdownvalue = newValue!;
                              ctxt
                                  .read<RegisterpageviewCubit>()
                                  .dropDownValue();
                            },
                          );
                        },
                      ),
                    ],
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

  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SlideInRight(
          delay: const Duration(milliseconds: 100),
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
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Color.fromARGB(255, 27, 94, 32)),
                border: InputBorder.none,
                labelText: "Email",
              ),
            ),
          ),
        ),
        ksize3,
        SlideInRight(
          delay: const Duration(milliseconds: 100),
          child: Container(
            padding: EdgeInsets.fromLTRB(1.h, 0.1.h, 1.h, 0.1.h),
            decoration: kboxDecoration1,
            child: TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.green[900]!),
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
              delay: const Duration(milliseconds: 100),
              child: Container(
                width: 40.w,
                padding: EdgeInsets.fromLTRB(1.h, 0.1.h, 1.h, 0.1.h),
                decoration: kboxDecoration1,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.green[900]!),
                    border: InputBorder.none,
                    labelText: "Password",
                  ),
                ),
              ),
            ),
            const Spacer(),
            SlideInRight(
              delay: const Duration(milliseconds: 100),
              child: Container(
                width: 40.w,
                padding: EdgeInsets.fromLTRB(1.h, 0.1.h, 1.h, 0.1.h),
                decoration: kboxDecoration1,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.green[900]!),
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
