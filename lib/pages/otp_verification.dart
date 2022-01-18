import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'widgets.dart';
import 'homepage.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    // Constructors
    myColors mc = myColors();
    widgets wd = widgets();
    // Values
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _otpValue = TextEditingController();

    return Scaffold(
      backgroundColor: mc.background,
      appBar: AppBar(
        title: wd.Header(),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: mc.background,
      ),
      body:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50.0,),
                //Image
                wd.putImage("1.png", 200.0, 200.0),

                // Verification Text
                Padding(
                  padding: const EdgeInsets.only(top:50.0),
                  child: Text(
                    "EMAIL VERIFICATION",
                    style: GoogleFonts.montserrat(
                        fontSize: 20.0,
                        color: mc.white,
                        letterSpacing: 4.0,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                const SizedBox(height: 30.0,),
                // Text for Entering OTP
                Text("OTP SENT TO YOUR EMAIL ADDRESS",
                  style: GoogleFonts.montserrat(
                      fontSize: 13.0,
                      color: mc.primaryBlue,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w300
                  ),
                ),
                const SizedBox(height: 20.0,),
                Text('ENTER OTP HERE',
                  style: GoogleFonts.montserrat(
                      fontSize: 20.0,
                      color: mc.greyText,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w300
                  ),
                ),
                const SizedBox(height: 30.0,),

                // OTP INPUT

                Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _otpValue,
                      decoration: wd.inputDecoration("ENTER OTP",Icon(Icons.security , color: mc.primaryBlue, size: 25.0)),
                      style: TextStyle(color: mc.white),
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        if (val == null || val.length == 0) {
                          return "OTP is required";
                        } else {
                          return null;
                        }
                      },
                    ),
                ),
                const SizedBox(height: 30.0,),
                // Verify Button
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(10.0),
                        primary: mc.Green,
                        fixedSize: const Size(240,44)
                    ),
                    onPressed: () =>{
                      if (_formKey.currentState!.validate())
                        {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            const SnackBar(
                                content:
                                Text("Verifying")
                            ),
                          ),
                          // Go to OTP Page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage()),
                          )
                        }
                    },
                    child:  Container(
                      child: Text("VERIFY OTP",
                          style: GoogleFonts.montserrat(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.w500
                          )),
                    )
                ),

                const SizedBox(height: 30.0,),

                // Resend OTP AGAIN

                InkWell(
                  onTap: () => {
                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("OTP SENT AGAIN."), backgroundColor: Colors.green,))
                  },
                  child: Text('SEND OTP AGAIN',
                    style: GoogleFonts.montserrat(
                        fontSize: 14.0,
                        color: mc.white,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
