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
    _registerDOB.text = DateTime.now() as String;


    final _formKey = GlobalKey<FormState>();
    // Constructors
    widgets wd = widgets();
    myColors mc = myColors();

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
                  SizedBox(height:60.0),

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
                    onPressed: () =>{
                      if (_formKey.currentState!.validate())
                        {
                          // Call User Model
                          Users(_registerEmail.text, _registerPassword.text, DateTime.now(), 0, 0, _registerFirstname.text, _registerLastname.text),
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            const SnackBar(
                                content:
                                Text('Please Verify your Email')
                            ),
                          ),
                          // Go to OTP Page
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const OtpVerification()),
                          )
                        }
                    },
                    child:  Container(
                      child: Text("CREATE NEW ACCOUNT",
                          style: GoogleFonts.montserrat(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.w500
                          )),
                    )
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

