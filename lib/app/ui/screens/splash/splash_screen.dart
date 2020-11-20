import 'package:flutter/material.dart';
import 'package:snowmanlabs/app/routes/app_routes.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFBE00),
      body: Stack(
        children: [
          SplashScreen(
            seconds: 5,
            backgroundColor: Color(0xffFFBE00),
            navigateAfterSeconds: Routes.HOME,
            loaderColor: Color(0xffFFBE00),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xffFFBE00),
              image: DecorationImage(
                image: AssetImage("assets/Splash@2x.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
