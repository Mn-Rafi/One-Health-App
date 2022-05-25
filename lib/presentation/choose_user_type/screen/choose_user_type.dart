
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:one_health_app/themedata.dart';
import 'package:sizer/sizer.dart';

class ChooseUserType extends StatefulWidget {
  const ChooseUserType({Key? key}) : super(key: key);

  @override
  State<ChooseUserType> createState() => _ChooseUserTypeState();
}

class _ChooseUserTypeState extends State<ChooseUserType> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        imageVerticalOffset: 15.h,
        hasSkip: true,
        pageBackgroundColor: Colors.white,
        headerBackgroundColor: Colors.white,
        finishButtonText: 'Finish',
        skipTextButton: const Text('Skip'),
        background: [
          Column(
            children: [
              const Iconify(yearsSvg),
              Image.asset('images/onboarding1.png'),
            ],
          ),
          Image.asset('images/onboarding1.png'),
          Image.asset('images/onboarding1.png'),
        ],
        totalPage: 3,
        speed: 1,
        pageBodies: const [
          Text('Description Text 1'),
          Text('Description Text 2'),
          Text('Description Text 1'),
        ],
      ),
    );
  }
}
