import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_health_app/api/connectivity_services.dart';
import 'package:one_health_app/api/login_api/login_api_method.dart';
import 'package:one_health_app/logic/login_api_bloc/apilogin_bloc.dart';
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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => ConnectivityServices(),
          )
        ],
        child: BlocProvider(
          create: (context) => ApiloginBloc(
            RepositoryProvider.of<ConnectivityServices>(context),
          )..add(ApiInitialEvent()),
          child: MaterialApp(
            theme: MyTheme.lightTheme,
            themeMode: ThemeMode.system,
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          ),
        ),
      );
    });
  }
}
