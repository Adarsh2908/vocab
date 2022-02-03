import 'package:Vocab/services/userservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets.dart';
import 'colors.dart';
import 'register.dart';
import 'homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;

class _LoginState extends State<Login> {
  String stayLogin = "0";
  final TextEditingController _loginPassword = TextEditingController();
  final TextEditingController _loginEmail = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final widgets wd = widgets();
  final myColors mc = myColors();

  @override
  Widget build(BuildContext context) {
    int res;
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: mc.Grey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: wd.Header(),
          centerTitle: true,
          backgroundColor: mc.Grey,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  wd.putImage("3.png", 250.0, 250.0),

                  const SizedBox(
                    height: 30.0,
                  ),

                  // Main Title
                  Text(
                    "LOGIN",
                    style: GoogleFonts.montserrat(
                        fontSize: 24.0,
                        color: mc.white,
                        letterSpacing: 4.0,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  // Form
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _loginEmail,
                            decoration: wd.inputDecoration(
                                "EMAIL ADDRESS",
                                Icon(Icons.supervised_user_circle,
                                    color: mc.primaryBlue, size: 25.0)),
                            style: TextStyle(color: mc.white),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "This Field Can't be Empty.";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          TextFormField(
                            controller: _loginPassword,
                            obscureText: true,
                            decoration: wd.inputDecoration(
                                "PASSWORD",
                                Icon(Icons.lock,
                                    color: mc.primaryBlue, size: 25.0)),
                            style: TextStyle(color: mc.white),
                            keyboardType: TextInputType.visiblePassword,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter your Password.";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),

                          // Checkbox

                          Theme(
                            data: Theme.of(context).copyWith(
                                unselectedWidgetColor: mc.primaryBlue),
                            child: CheckboxListTile(
                                activeColor: mc.Green,
                                checkColor: mc.white,
                                value: stayLogin == "1" ? true : false,
                                title: Text(
                                  "Remember me",
                                  style: GoogleFonts.montserrat(
                                      color: mc.white,
                                      fontSize: 15.0,
                                      letterSpacing: 2.0),
                                ),
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (value == true) {
                                      stayLogin = "1";
                                    } else {
                                      stayLogin = "0";
                                    }
                                  });
                                }),
                          ),

                          const SizedBox(
                            height: 40.0,
                          ),
                          // Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Login Button
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(10.0),
                                      primary: mc.primaryBlue,
                                      fixedSize: const Size(150, 50)),
                                  onPressed: () async => {
                                        prefs = await SharedPreferences
                                            .getInstance(),
                                        // Checking Form Validation
                                        if (_formKey.currentState!.validate())
                                          {
                                            // Now after the Auth we need to store the status of user that he stays login or not
                                            // Load Shared Pref here because we need to update the remember me in the storage
                                            if (!wd.validateEmail(
                                                _loginEmail.text))
                                              {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  content: Text(
                                                      'Invalid Email Address'),
                                                  backgroundColor: Colors.red,
                                                ))
                                              }
                                            //Check Weather The password is correct or not

                                            // Else When email and password is correct
                                            else
                                              {
                                               res =  await UserService().login(_loginEmail.text, _loginPassword.text),
                                                if(res == 1)
                                                  {
                                                    prefs.setString(
                                                        'logged', stayLogin),
                                                    prefs.setString(
                                                        'email',
                                                        _loginEmail.text),
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                          const HomePage()),
                                                    ),
                                                  }
                                                else if(res == 2)
                                                  {
                                                    wd.snackBar(context, "User not Found.")
                                                  }
                                                else if(res == 3)
                                                  {
                                                    wd.snackBar(context, "Wrong Password.")

                                                  }
                                                else
                                                  {
                                                    wd.snackBar(context, "Server Error.")

                                                  }
                                              }
                                          }
                                      },
                                  child: Text("LOGIN",
                                      style: GoogleFonts.montserrat(
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.w500))),

                              // OR TEXT
                              Text(
                                "OR",
                                style: GoogleFonts.montserrat(
                                    fontSize: 10.0,
                                    color: mc.white,
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.w300),
                              ),

                              // Register Button
                              ElevatedButton(
                                style: wd.elevatedButtonStyle(
                                    mc.Green, 150.0, 50.0),
                                onPressed: () => {
                                  // Send the Flow to the Register Page
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Register()))
                                },
                                child: Text("REGISTER",
                                    style: GoogleFonts.montserrat(
                                        letterSpacing: 1.0,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ],
                          ),

                          // Footer
                          const SizedBox(
                            height: 40.0,
                          ),
                          wd.footer()
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
