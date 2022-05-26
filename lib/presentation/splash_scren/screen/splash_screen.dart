
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_health_app/presentation/onboarding/screen/on_boarding_screen.dart';
import 'package:one_health_app/presentation/splash_scren/splash_cubit/splashscreen_cubit.dart';
import 'package:one_health_app/presentation/user_login/loginpage/login_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    precacheImage(Image.asset('images/onboarding1.png').image, context);
    precacheImage(Image.asset('images/loginillustration.png').image, context);
    precacheImage(
        Image.asset('images/One Health Logo Splash.png').image, context);
    return BlocProvider(
      create: (context) => SplashscreenCubit(),
      child: BlocListener<SplashscreenCubit, SplashscreenState>(
        listener: (context, state) {
          if (state is SplashScreenEnd) {
            Navigator.pushReplacement(
                context,
                PageTransition(
                    duration: const Duration(milliseconds: 600),
                    child: const OnBoarding(),
                    type: PageTransitionType.fade));
          }
        },
        child: Scaffold(
          body: Center(
            child: Pulse(
                child: Image(
              image: const AssetImage('images/One Health Logo Splash.png'),
              width: 70.w,
            )),
          ),
        ),
      ),
    );
  }
}
