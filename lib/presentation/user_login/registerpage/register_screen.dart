import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:one_health_app/logic/login_api_bloc/apilogin_bloc.dart';
import 'package:one_health_app/logic/register_page_view.dart_cubit/registerpageview_cubit.dart';
import 'package:one_health_app/presentation/user_login/loginpage/login_page.dart';
import 'package:one_health_app/presentation/user_login/loginpage/utilities.dart';
import 'package:one_health_app/presentation/user_login/registerpage/utilities.dart';
import 'package:one_health_app/utilities.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final PageController controller = PageController();

  int previousPage = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ApiloginBloc, ApiloginState>(
      listener: (context, state) {
        if (state is ApiRegisteNewStartstate) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context)
              .showSnackBar(snackBar('Checking register details'));
        }
        if (state is ApiRegisteNewENdstate) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context)
              .showSnackBar(snackBar('Account registered succesfully'));
          Navigator.pushAndRemoveUntil(
              context,
              PageTransition(
                  duration: const Duration(milliseconds: 600),
                  child: const LoginPage(),
                  type: PageTransitionType.fade),
              (route) => false);
        }
        if (state is ApiRegisteNewErrorstate) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(snackBar(state.error));
        }
      },
      child: BlocProvider(
        create: (context) => RegisterpageviewCubit(),
        child: Scaffold(
            appBar: appBar,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  children: [
                    ksize3,
                    Center(
                      child: Text(
                        "Don't have an Account?\nCreate your account now",
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
                        text: "It's quick and easy.",
                      ),
                    ),
                    ksize3,
                    GestureDetector(
                      onTap: () {
                        pickImage();
                      },
                      child: FadeIn(
                        delay: const Duration(milliseconds: 400),
                        child: Center(
                            child: SizedBox(
                          height: 22.h,
                          width: 50.w,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green[900]!),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.green[900],
                                    size: 50.w,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(2.w),
                                child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Icon(
                                      Icons.add_photo_alternate_outlined,
                                      color: Colors.green[900]!,
                                    )),
                              )
                            ],
                          ),
                        )),
                      ),
                    ),
                    ksize3,
                    Builder(builder: (context) {
                      return SizedBox(
                        height: 30.h,
                        child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          onPageChanged: (page) {
                            previousPage = page;
                            context
                                .read<RegisterpageviewCubit>()
                                .pageChangeStart();
                          },
                          controller: controller,
                          children: [
                            PageViewFirst(ctxt: context),
                            const PageViewSecond(),
                          ],
                        ),
                      );
                    }),
                    ksize3,
                    BlocConsumer<RegisterpageviewCubit, RegisterpageviewState>(
                      listener: (context, state) {
                        if (state is RegisterpageviewEnd) {
                          Navigator.pop(context);
                        }
                      },
                      builder: (context, state) {
                        return previousPage == 0
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 9.w,
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 1.7.w,
                                          backgroundColor: Colors.green[900],
                                        ),
                                        const Spacer(),
                                        CircleAvatar(
                                          radius: 1.2.w,
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 20.w,
                                    height: 4.h,
                                    decoration: kboxDecoration1.copyWith(
                                        color: Colors.green[900]),
                                    child: TextButton.icon(
                                      onPressed: () {
                                        controller.jumpToPage(1);
                                      },
                                      icon: const Text(
                                        'Next',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      label: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 12.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 9.w,
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 1.2.w,
                                        ),
                                        const Spacer(),
                                        CircleAvatar(
                                          radius: 1.7.w,
                                          backgroundColor: Colors.green[900],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 22.w,
                                    height: 4.h,
                                    decoration: kboxDecoration1.copyWith(
                                        color: Colors.green[900]),
                                    child: TextButton.icon(
                                      onPressed: () {
                                        print(imagePath);
                                        context.read<ApiloginBloc>().add(
                                            ApiRegisterNew(
                                                age: 18,
                                                blood: 'A+ve',
                                                email:
                                                    PageViewSecond
                                                        .emailController.text,
                                                firstName:
                                                    PageViewFirst
                                                        .firstNameController
                                                        .text,
                                                gender: 'Male',
                                                image: imagePath,
                                                password: PageViewSecond
                                                    .passwordController.text,
                                                phone: '+918590652057',
                                                secondName: PageViewFirst
                                                    .lastNameController.text));
                                      },
                                      icon: const Text(
                                        'Submit',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      label: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 12.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                      },
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }

  File? imagePath;
  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    imagePath = File(image!.path);
  }
}
