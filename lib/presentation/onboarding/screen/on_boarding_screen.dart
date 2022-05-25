import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:one_health_app/presentation/onboarding/onboarding_cubit/onboarding_cubit.dart';
import 'package:one_health_app/presentation/onboarding/screen/onboarding_utitlities.dart';
import 'package:one_health_app/presentation/user_login/loginpage/login_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Builder(
        builder: (context) {
          return BlocListener<OnboardingCubit, OnboardingState>(
            listener: (context, state) {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      duration: const Duration(milliseconds: 600),
                      child: const LoginPage(),
                      type: PageTransitionType.fade));
            },
            child: const OnBoardingBody(),
          );
        }
      ),
    );
  }
}

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        onFinish: () {
          context.read<OnboardingCubit>().navigateToHome();
        },
        imageVerticalOffset: 15.h,
        hasSkip: true,
        pageBackgroundColor: Colors.white,
        headerBackgroundColor: Colors.white,
        finishButtonText: 'Finish',
        skipTextButton: Text(
          'Skip',
          style: TextStyle(color: Colors.green[900]),
        ),
        controllerColor: Colors.green[900],
        finishButtonColor: Colors.green[900],
        background: const [
          OnBoardingScreenOne(),
          OnBoardingScreenTwo(),
          OnBoardingScreenThree(),
        ],
        totalPage: 3,
        speed: 1,
        pageBodies: const [
          OnBoardingLogo(),
          OnBoardingLogo(),
          OnBoardingLogo(),
        ],
      ),
    );
  }
}
