import 'dart:math';
import 'package:Vocab/services/userservice.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';
import 'colors.dart';
import 'otp_verification.dart';
import 'widgets.dart';
import '../models/users.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  @override
  Widget build(BuildContext context) {

    // Values
    final TextEditingController _registerEmail = TextEditingController();
    final TextEditingController _registerPassword = TextEditingController();
    final TextEditingController _registerConfirmPassword = TextEditingController();
    final TextEditingController _registerDOB = TextEditingController();
    final TextEditingController _registerFirstname= TextEditingController();
    final TextEditingController _registerLastname = TextEditingController();


    final _formKey = GlobalKey<FormState>();

    // Constructors
    widgets wd = widgets();
    myColors mc = myColors();
    UserService us = UserService();
    Users newUser;
    Random random;
    int otp;
    String emailResponse;
    int res;
    return Scaffold(
        backgroundColor: mc.Grey,
        appBar: AppBar(
          backgroundColor: mc.Grey,
          elevation: 0,
          title: wd.Header(),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [

                // Text - User Registration
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Text(
                    "USER REGISTRATION",
                    style: GoogleFonts.montserrat(
                        fontSize: 20.0,
                        color: mc.white,
                        letterSpacing: 4.0,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                  const SizedBox(height:60.0),

                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Email Field
                        TextFormField(
                          controller: _registerEmail,
                          decoration: wd.inputDecoration("EMAIL ADDRESS",Icon(Icons.supervised_user_circle , color: mc.primaryBlue, size: 25.0)),
                          style: TextStyle(color: mc.white),
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Email is Required";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height:25.0),
                        // Password Field
                        TextFormField(
                          controller: _registerPassword,
                          decoration: wd.inputDecoration("PASSWORD",Icon(Icons.lock , color: mc.primaryBlue, size: 25.0)),
                          style: TextStyle(color: mc.white),
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Please enter your Password.";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height:25.0),
                        // Confirm Password Field
                        TextFormField(
                          controller: _registerConfirmPassword,
                          decoration: wd.inputDecoration("CONFIRM PASSWORD",Icon(Icons.lock , color: mc.primaryBlue, size: 25.0)),
                          style: TextStyle(color: mc.white),
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Please enter your Password.";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height:25.0),
                        // Date of Birth Field
                        TextFormField(
                          controller: _registerDOB,
                          decoration: wd.inputDecoration("DATE OF BIRTH",Icon(Icons.date_range_outlined , color: mc.primaryBlue, size: 25.0)),
                          style: TextStyle(color: mc.white),
                          keyboardType: TextInputType.visiblePassword,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Please Enter your DOB";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height:25.0),
                        // First Name
                        TextFormField(
                          controller: _registerFirstname,
                          decoration: wd.inputDecoration("FIRST NAME ",Icon(Icons.verified_user , color: mc.primaryBlue, size: 25.0)),
                          style: TextStyle(color: mc.white),
                          keyboardType: TextInputType.visiblePassword,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Enter First Name";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height:25.0),
                        // Last Name
                        TextFormField(
                          controller: _registerLastname,
                          decoration: wd.inputDecoration("LAST NAME ",Icon(Icons.verified_user , color: mc.primaryBlue, size: 25.0)),
                          style: TextStyle(color: mc.white),
                          keyboardType: TextInputType.text,
                        ),
                        ]
                    )
                ),
                const SizedBox(height:25.0),
                // Adding Register Button
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10.0),
                        primary: mc.Green,
                        fixedSize: const Size(240,44)
                    ),
                    onPressed: ()  async =>{
                      if (_formKey.currentState!.validate())
                        {
                            // We have to check if the Email is Valid or not
                          if(!wd.validateEmail(_registerEmail.text))
                            {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                            const SnackBar(
                            content:
                            Text('Invalid Email Address'),
                            backgroundColor: Colors.red,
                            ))
                            },
                          // Check if Password == confirm Password
                          if(_registerPassword.text != _registerConfirmPassword.text)
                            {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                  const SnackBar(
                                    content:
                                    Text('Password Does not match'),
                                    backgroundColor: Colors.red,
                                  ))
                            }
                          else // When Everything is Fine
                            {
                              // Call User Model
                              newUser = Users(
                                  _registerEmail.text,
                                  _registerPassword.text,
                                  _registerDOB.text,
                                  "0",
                                  "0",
                                  _registerFirstname.text,
                                  _registerLastname.text),

                              // Call User Save method

                              res = await UserService().exists(_registerEmail.text),

                              // If user Exists
                              if(res == 2)
                                {
                                  wd.snackBar(context, "Email Already in use.")
                                }
                                else
                                  if(res == 1)
                                    {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content:
                                            Text('Please Verify your Email')
                                        ),
                                      ),
                                      // SEND Email now
                                      wd.sendOTP(_registerEmail.text),
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>
                                            OtpVerification(
                                                email: _registerEmail.text, data: newUser.userData())),
                                      ),
                                    }
                            }
                            }

                    },
                    child:  Text("CREATE NEW ACCOUNT",
                        style: GoogleFonts.montserrat(
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.w500
                        ))
                ),
                const SizedBox(height:20.0),
                InkWell(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                    )
                  },
                  child: Text('LOG IN',
                    style: GoogleFonts.montserrat(
                        fontSize: 10.0,
                        color: mc.greyText,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w300
                    ),
                  ),
                ),

                const SizedBox(height:30.0),

                wd.footer()

              ],
            ),
          ),
        )
    );
  }
}

