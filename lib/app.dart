import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:siska_improve/_routing/routes.dart';
import 'package:siska_improve/_routing/router.dart' as router;
import 'package:siska_improve/theme.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:siska_improve/views/landing.dart';
import 'package:siska_improve/views/landingaktivasi.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    FlutterStatusbarcolor.setNavigationBarColor(Colors.blue);
    return MaterialApp(
      title: 'SIsKA-NG',
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      onGenerateRoute: router.generateRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firebaseTrigger(context);
  }

  void firebaseTrigger(BuildContext context) async {
    _firebaseMessaging.configure(
      onMessage: (message) {
        print(message);
      },
      onLaunch: (message) {
        print(message);
        final data = message['data'];
        if (data['page'] != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LandingAktivasiPage(),
            ),
          );
        }
      },
      onResume: (message) {
        print(message);
        final data = message['data'];
        if (data['page'] != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LandingAktivasiPage(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    FlutterStatusbarcolor.setNavigationBarColor(Colors.blue);
    return MaterialApp(
      title: 'SIsKA-NG',
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
      onGenerateRoute: router.generateRoute,
    );
  }
}
