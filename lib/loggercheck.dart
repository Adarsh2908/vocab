import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoggerCheck extends StatefulWidget {
  const LoggerCheck({Key? key}) : super(key: key);

  @override
  _LoggerCheckState createState() => _LoggerCheckState();
}

class _LoggerCheckState extends State<LoggerCheck> {
  @override
  void initState() {
    getUserData();
    super.initState();
  }

  // Variables
  String loggedIn="";
  String email="";
  // Functions
  getUserData() async{
    SharedPreferences data = await SharedPreferences.getInstance();
    setState(() {
      loggedIn = data.getString('logged')!;
      email = data.getString('email')!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return loggedIn == "1" ? const HomePage():const Login();
  }
}
