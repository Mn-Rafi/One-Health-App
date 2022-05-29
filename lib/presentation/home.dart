import 'package:flutter/material.dart';
import 'package:one_health_app/presentation/user_login/loginpage/login_page.dart';
import 'package:one_health_app/utilities.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Center(child: Column(
        children: [
          // Image.network(LoginPage.userDetails!.image, fit: BoxFit.cover,),
          // Text('Name ${LoginPage.userDetails!.firstName.toString()}'),
          Text('WELCOME HOMEEEEEEEEEEEEEEEEEE')
        ],
      ),)
    );
  }
}