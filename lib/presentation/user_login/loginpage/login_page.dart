import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:one_health_app/utilities.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
              SizedBox(
                height: 3.h,
              ),
              Text(
                'Hello Guest!\nWelcome to One Health App',
                textAlign: TextAlign.left,
                style: GoogleFonts.ubuntu(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'Before Continue, Please Sign in First.',
                textAlign: TextAlign.left,
                style: GoogleFonts.ubuntu(
                  fontSize: 11.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(1.h, 0.1.h, 1.h, 0.1.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.green)),
                child: const TextField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.green),
                    border: InputBorder.none,
                    labelText: "Email",
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(1.h, 0.1.h, 1.h, 0.1.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.green)),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.green),
                    suffixIcon: GestureDetector(
                        onTap: () {}, child: Icon(Icons.visibility_off)),
                    border: InputBorder.none,
                    labelText: "Password",
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70.w,
                    height: 5.h,
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(1.h, 0.1.h, 1.h, 0.1.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.green)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Sign In',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.ubuntu(
                          fontSize: 11.sp,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //     height: 30.h,
              //     child: Stack(
              //       children: [Text('III')],
              //     ))
            ],
          ),
        ),
      ),
    );
  }
}
