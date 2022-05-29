import 'package:flutter/material.dart';
import 'package:siska_improve/_routing/routes.dart';
import 'package:siska_improve/views/register.dart';
import 'package:siska_improve/views/splash.dart';
import 'package:siska_improve/views/landing.dart';
import 'package:siska_improve/views/login.dart';
import 'package:siska_improve/views/lupapassswordemail.dart';
import 'package:siska_improve/views/lupapassword.dart';
import 'package:siska_improve/views/landingaktivasi.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case landingViewRoute:
      return MaterialPageRoute(builder: (context) => LandingPage());
    case splashViewRoute:
      return MaterialPageRoute(builder: (context) => Splash());
    case registerViewRoute:
      return MaterialPageRoute(builder: (context) => RegisterPage());
    case loginViewRoute:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case lupaPasswordEmailViewRoute:
      return MaterialPageRoute(builder: (context) => LupaPasswordEmail());
    case lupaPasswordViewRoute:
      return MaterialPageRoute(builder: (context) => LupaPassword());
    case landingAktivasiPageRoute:
      return MaterialPageRoute(builder: (context) => LandingAktivasiPage());
    default:
  }
}
