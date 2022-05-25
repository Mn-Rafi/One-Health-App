import 'package:flutter/material.dart';
import 'package:one_health_app/presentation/splash_scren/screen/splash_screen.dart';
import 'package:one_health_app/themedata.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return  MaterialApp(
          theme: MyTheme.lightTheme,
          themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
      }
 );
   
  }
}
