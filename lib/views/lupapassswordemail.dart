import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:siska_improve/_routing/routes.dart';
import 'package:siska_improve/utils/colors.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flushbar/flushbar.dart';

class LupaPasswordEmail extends StatefulWidget {
  @override
  _LupaPasswordEmail createState() => _LupaPasswordEmail();
}

class _LupaPasswordEmail extends State<LupaPasswordEmail> {
  final _email = TextEditingController();
  bool _saving = false;

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }

  final _formKey = GlobalKey<FormState>();
  String _name = '';
  // use this to keep track of when the form is submitted
  bool _submitted = false;

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

  void simpan(BuildContext context) async {
    Navigator.pushNamed(context, lupaPasswordViewRoute);
  }

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
          "Silahkan Masukkan Email yang Terdaftar!",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );

    final emailField = TextFormField(
      controller: _email,
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(
          LineIcons.at,
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
      validator: (_email) {
        if (_email == null || _email.isEmpty) {
          return 'Data Tidak Boleh Kosong';
        }
        if (validateEmail(_email) == false) {
          return 'Format Email Salah';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
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
                  emailField,
                  konfirmasiBtn,
                ],
              ),
            ),
          ),
          inAsyncCall: _saving),
    );
  }
}
