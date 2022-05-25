import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_health_app/presentation/choose_user_type/screen/choose_user_type.dart';
import 'package:one_health_app/presentation/splash_scren/splash_cubit/splashscreen_cubit.dart';
import 'package:sizer/sizer.dart';
import 'package:animate_do/animate_do.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashscreenCubit(),
      child: BlocListener<SplashscreenCubit, SplashscreenState>(
        listener: (context, state) {
          if (state is SplashScreenEnd) {
            Navigator.pushReplacement(
                context,
                PageTransition(
                    child: const ChooseUserType(),
                    type: PageTransitionType.scale,
                    alignment: Alignment.bottomCenter));
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
