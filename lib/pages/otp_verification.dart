import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'widgets.dart';
import 'homepage.dart';
class OtpVerification extends StatefulWidget {
  final String email;
  const OtpVerification({Key? key, required this.email}) : super(key: key);

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
    bool isValid;
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
                        if (val == null || val.isEmpty) {
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
                        padding: const EdgeInsets.all(10.0),
                        primary: mc.Green,
                        fixedSize: const Size(240,44)
                    ),
                    onPressed: () async =>{
                      if (_formKey.currentState!.validate())
                        {
                          isValid = await wd.verifyOTP(widget.email, _otpValue.text) ,
                          if(isValid)
                            {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                const SnackBar(
                                  content:
                                  Text("Verified"),
                                  backgroundColor: Colors.green,
                                ),
                              ),
                              // Go to OTP Page
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const HomePage()),
                              )
                            }
                          else
                            {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                const SnackBar(
                                  content:
                                  Text("Invalid OTP"),
                                  backgroundColor: Colors.redAccent,
                                ),
                              ),
                            }
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
