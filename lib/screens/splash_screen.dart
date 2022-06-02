import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:untitled/screens/login_screen.dart';

import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  final storage = new FlutterSecureStorage();

  Future<bool> checkLoginState() async {
    String? value = await storage.read(key: 'uid');

    if (value == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasySplashScreen(
        logo: Image.asset(
          'assets/logo.png',
        ),
        logoSize: 170,
        backgroundColor: Colors.white,
        navigator: FutureBuilder(
          future: checkLoginState(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data == false) {
              return LoginScreen();
            } else {
              return HomeScreen();
            }
          },
        ),
        showLoader: false,
        durationInSeconds: 2,
      ),
    );
  }
}
