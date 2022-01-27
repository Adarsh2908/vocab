import 'package:Vocab/pages/login.dart';
import 'package:Vocab/pages/saved_words.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bug_report.dart';
import 'widgets.dart';
import 'colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    widgets wd = widgets();
    myColors mc = myColors();
    return Scaffold(
      backgroundColor: mc.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: wd.Header(),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: mc.background,
      ),

      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                // row for UserImage ,  UserName and Badges
                Row(
                  children: [
                   const SizedBox(height: 20.0,),
                    // User Image
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: wd.putImage("1.png", 70.0, 70.0),
                    ),
                    const SizedBox(width: 20.0,),
                    // UserName
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Username
                        wd.putText("ADARSH", 25.0, 2.0,mc.white),
                        const SizedBox(height: 10.0,),

                        //User Badges
                        wd.putText("Badges in This Area", 15.0, 2.0,mc.white),
                      ],
                    ),
                    // Buttons Row
                  ],
                ),
                const SizedBox(height: 30.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Logout
                    ElevatedButton(
                      style: wd.elevatedButtonStyle(mc.primaryBlue, 100.0, 20.0),
                      onPressed: () async =>  {
                      prefs = await SharedPreferences.getInstance(),
                        // Set logged to false in the Prefs
                        prefs.setString('logged', "0"),
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Login())
                        )
                      },
                      child:Text("LOGOUT",
                          style: GoogleFonts.montserrat(
                              letterSpacing: 1.0,
                              fontSize: 10.0,
                              fontWeight: FontWeight.w500)),
                    ),
                    // Favorite
                    ElevatedButton(
                      style: wd.elevatedButtonStyle(mc.Green, 100.0, 20.0),
                      onPressed: () => {
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SavedWords()),
                        ),
                      },
                      child:Text("FAVORITES",
                          style: GoogleFonts.montserrat(
                              letterSpacing: 1.0,
                              fontSize: 10.0,
                              fontWeight: FontWeight.w500)),
                    ),
                    // Report Error
                    ElevatedButton(
                      style: wd.elevatedButtonStyle(mc.Red, 120.0, 20.0),
                      onPressed: () => {
                        Navigator.push(
                            context,
                          MaterialPageRoute(builder: (context)=> const ReportError())
                        )
                      },
                      child:Text("REPORT BUG",
                          style: GoogleFonts.montserrat(
                              letterSpacing: 1.0,
                              fontSize: 10.0,
                              fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
               const SizedBox(height: 30.0,),
               // User Statics

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    wd.homePageCard("STREAK", "KEEP GOING ", "50",mc.Blue,mc.primaryBlue),
                    wd.homePageCard("DAYS", "STAY CONSISTENT", "20",mc.TransRed,mc.Red),
                  ],
                ),
                const SizedBox(height: 30.0,),

                // Today's Words
                wd.putText("TODAY'S WORDS", 18.0, 2.0, mc.greyText),

                // Words List
                const SizedBox(height: 25.0,),

                wd.wordCard("Arise", "Hindi" , "This Means all of this is nice.", 1, MediaQuery.of(context).size.width,context),
                const SizedBox(height: 15.0,),
                wd.wordCard("Atrocity", "Hindi" , "This Means all of this is nice.", 2, MediaQuery.of(context).size.width,context),
                const SizedBox(height: 15.0,),
                wd.wordCard("Obnoxious", "Hindi" , "This Means all of this is nice.", 1, MediaQuery.of(context).size.width,context),
                const SizedBox(height: 15.0,),
                wd.wordCard("Arise", "Hindi" , "This Means all of this is nice.", 2, MediaQuery.of(context).size.width,context),
                const SizedBox(height: 15.0,),
                wd.wordCard("Arise", "Hindi" , "This Means all of this is nice.", 1, MediaQuery.of(context).size.width,context),
                const SizedBox(height: 15.0,),
                wd.wordCard("Arise", "Hindi" , "This Means all of this is nice.", 2, MediaQuery.of(context).size.width,context),

              ],
            ),
          )
      ),
    );
  }
}


