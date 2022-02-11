import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'register.dart';
import 'login.dart';
import 'colors.dart';
import 'widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
   // Variables
    const String mainTitle = "V O C A B   M A S T E R";
    //Constructor
    final myColors mc = myColors();
    final widgets wd = widgets();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0,40.0,20.0,0.0),
        child: Scaffold(
          backgroundColor: mc.background,
          appBar: AppBar(
            title: wd.Header(),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [

                  // Image
                  wd.putImage("2.png", 250.0, 250.0),

                  // Quote
                  Text('"Hard Work betrays none."',
                    style: GoogleFonts.montserrat(
                        fontSize: 14.0,
                        color: mc.greyText,
                        letterSpacing: 4.0,
                        fontWeight: FontWeight.w200
                    ),),
                  const SizedBox(height: 60.0,),

                  // Main Title
                  Text(mainTitle,
                    style: GoogleFonts.montserrat(
                        fontSize: 24.0,
                        color: mc.white,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w300
                    ),),
                  const SizedBox(height: 60.0,),

                  // Register Button
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(10.0),
                          primary: mc.primaryBlue,
                          fixedSize: const Size(220,44)
                      ),
                      onPressed: () =>{
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Register())
                        )
                      },
                      child:  Text("CREATE NEW ACCOUNT",
                          style: GoogleFonts.montserrat(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.w500
                          ))
                  ),
                  const SizedBox(height: 20.0,),
                  // OR TExt
                  Text("O R",
                    style: GoogleFonts.montserrat(
                        fontSize: 12.0,
                        color: mc.white,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w300
                    ),),

                  const SizedBox(height: 20.0,),

                  // Login Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10.0),
                        primary: mc.Blue,
                        fixedSize: const Size(220,44)
                    ),
                    onPressed: () =>{
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Login())
                      )
                    },
                    child:  Text("LOGIN",
                        style: GoogleFonts.montserrat(
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.w500,
                            color: mc.primaryBlue
                        )),
                  ),
                  const SizedBox(height: 35.0,),
                  // Last Quote
                  Text('“BELIEVE IN YOURSELF”',
                    style: GoogleFonts.montserrat(
                        fontSize: 15.0,
                        color: mc.greyText,
                        letterSpacing: 4.0,
                        fontWeight: FontWeight.w200
                    ),),
                  const SizedBox(height: 50.0,),
                  // Footer
                  wd.footer()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

