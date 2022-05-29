import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);
  _Splash createState() => _Splash();
}

class _Splash extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SplashScreen(
          seconds: 1,
          title: new Text('SisKa'),
          image: new Image.asset('assets/images/LogoUndiksha.png'),
          backgroundColor: Colors.white,
          styleTextUnderTheLoader: new TextStyle(),
          photoSize: 100.0,
          loaderColor: Colors.blue),
    );
  }
}

// class AfterSplash extends StatelessWidget {
