import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:siska_improve/_routing/routes.dart';
import 'package:siska_improve/utils/colors.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flushbar/flushbar.dart';

class LupaPassword extends StatefulWidget {
  @override
  _LupaPassword createState() => _LupaPassword();
}

class _LupaPassword extends State<LupaPassword> {
  final _password = TextEditingController();
  final _passwordKonfirmasi = TextEditingController();
  bool _saving = false;

  void showFlushbar(String title, String message, IconData icon, Color color,
      BuildContext context) {
    Flushbar(
      title: title,
      message: message,
      icon: Icon(
        icon,
        size: 28,
        color: color,
      ),
      leftBarIndicatorColor: color,
      duration: Duration(seconds: 3),
    )..show(context);
  }

  bool validateStructure(String value) {
    String pattern = r'^(?=.*?[a-z])(?=.*?[0-9])';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  void simpan(BuildContext context) async {}

  @override
  Widget build(BuildContext context) {
    // Change Status Bar Color
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    FlutterStatusbarcolor.setNavigationBarColor(Colors.blue);
    final pageTitle = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Lupa Password",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 45.0,
          ),
        ),
        Text(
          "Silahkan Masukkan Password Baru!",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );

    final passwordField = TextFormField(
      controller: _password,
      decoration: InputDecoration(
        labelText: 'Ketikan Password Baru',
        labelStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(
          LineIcons.lock,
          color: Colors.white,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // The validator receives the text that the user has entered.
      validator: (_password) {
        if (_password == null || _password.isEmpty) {
          return 'Data Tidak Boleh Kosong';
        }
        if (_password.length < 8) {
          return 'Password Terlalu Pendek';
        }

        return null;
      },
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      obscureText: true,
    );

    final passwordKonfirmasiField = TextFormField(
      controller: _passwordKonfirmasi,
      decoration: InputDecoration(
        labelText: 'Konfirmasi Password Baru',
        labelStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(
          LineIcons.lock,
          color: Colors.white,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // The validator receives the text that the user has entered.
      validator: (_passwordKonfirmasi) {
        if (_passwordKonfirmasi == null || _passwordKonfirmasi.isEmpty) {
          return 'Data Tidak Boleh Kosong';
        }
        if (_passwordKonfirmasi.length < 8) {
          return 'Password Terlalu Pendek';
        }

        return null;
      },
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      obscureText: true,
    );

    final gantipasswordForm = Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: Form(
        child: Column(
          children: <Widget>[passwordField, passwordKonfirmasiField],
        ),
      ),
    );

    final konfirmasiBtn = Container(
      margin: EdgeInsets.only(top: 40.0),
      height: 60.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        border: Border.all(color: Colors.white),
        color: Colors.white,
      ),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          simpan(context);
        },
        color: Colors.white,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(7.0),
        ),
        child: Text(
          'Konfirmasi',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20.0,
          ),
        ),
      ),
    );

    return Scaffold(
      body: ModalProgressHUD(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
              decoration: BoxDecoration(gradient: primaryGradient),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  pageTitle,
                  gantipasswordForm,
                  konfirmasiBtn,
                ],
              ),
            ),
          ),
          inAsyncCall: _saving),
    );
  }
}
