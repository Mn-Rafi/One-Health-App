import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_health_app/presentation/user_login/loginpage/utilities.dart';
import 'package:one_health_app/presentation/user_login/registerpage/register_page_view.dart/registerpageview_cubit.dart';
import 'package:one_health_app/presentation/user_login/registerpage/utilities.dart';
import 'package:one_health_app/utilities.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final PageController controller = PageController();

  int previousPage = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
                  FadeIn(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      context
                                          .read<RegisterpageviewCubit>()
                                          .pageChangeEnd();
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
    );
  }
}
