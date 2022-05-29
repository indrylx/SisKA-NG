import 'package:flutter/material.dart';
import 'package:siska_improve/_routing/routes.dart';
import 'package:siska_improve/utils/colors.dart';
import 'package:siska_improve/utils/utils.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class LandingAktivasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    FlutterStatusbarcolor.setNavigationBarColor(Colors.blue);

    final logo = Container(
      width: double.infinity,
      height: 500,
      alignment: Alignment.center,
      child: Container(
        width: 250,
        height: 250,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AvailableImages.appLogo,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

    final appName = Column(
      children: <Widget>[
        Text(
          AppConfig.appName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18.0,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'Aktivasi Akun Anda Telah Disetujui Silahkan Login Dengan Menekan Tombol Di Bawah',
          style: TextStyle(
              color: Colors.white, fontSize: 13.0, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        )
      ],
    );

    final loginBtn = Container(
      margin: const EdgeInsets.only(top: 30),
      height: 50.0,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        border: Border.all(color: Colors.white),
        color: Colors.white,
      ),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => Navigator.pushNamed(context, loginViewRoute),
        color: Colors.white,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(7.0),
        ),
        child: Text(
          'Login',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),
      ),
    );

    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 70.0),
              decoration: BoxDecoration(gradient: primaryGradient),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[logo, appName, loginBtn],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Container(
                  height: 300.0,
                  width: MediaQuery.of(context).size.width,
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     image: AvailableImages.homePage,
                  //     fit: BoxFit.contain,
                  //   ),
                  // ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
