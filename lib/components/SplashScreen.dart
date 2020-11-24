import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:ui';
import 'HomePage.dart';

class Splash_Screen extends StatelessWidget {
  final String greetings = 'Greetings, traveler';


  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new HomePage(),
      title: new Text('Weather app',style: TextStyle( color: Colors.white,
          fontSize: 40,
          height: 0.5,
          fontWeight: FontWeight.w600,
          shadows: [Shadow(color: Colors.black,blurRadius: 22)]),),
      image: new Image.asset('images/logo.png'),
      photoSize: 150.0,

      // backgroundColor: Colors.white,
      gradientBackground: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color.fromARGB(255, 79, 104, 157),
          const Color.fromARGB(255, 222, 236, 253),
        ],
      ),
      loaderColor: Colors.white,
    );
  }
}
