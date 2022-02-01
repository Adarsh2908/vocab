import 'package:Vocab/pages/login.dart';
import 'package:Vocab/pages/saved_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bug_report.dart';
import 'widgets.dart';
import 'colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/getwords.dart';
import '../services/getquote.dart';
SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    widgets wd = widgets();
    myColors mc = myColors();
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return Future.value(false);
      },
      child: Scaffold(
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
                          Navigator.pushReplacement(
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

                        },
                        child:Text("SEARCH",
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
                      wd.homePageCard("WORDS", "KEEP GOING ", "50",mc.Blue,mc.primaryBlue),
                      wd.homePageCard("DAYS", "STAY CONSISTENT", "20",mc.TransRed,mc.Red),
                    ],
                  ),
                  const SizedBox(height: 40.0,),

                  // Today's Words
                  wd.putText("TODAY'S WORDS", 18.0, 2.0, mc.greyText),

                  // Words List
                  const SizedBox(height: 25.0,),

                  // Gimme List Button
                  ElevatedButton(
                    style: wd.elevatedButtonStyle(mc.Green, 230.0, 40.0),
                    onPressed: () => {
                      GetWords().getWords(),
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SavedWords()),
                      ),
                    },
                    child:Text("GET TODAY's WORDS",
                        style: GoogleFonts.montserrat(
                            letterSpacing: 2.0,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500)),
                  ),

                  // Today's Quotes
                  const SizedBox(height: 20.0,),

                  // Today's Words

                  const SizedBox(height: 15.0,),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: mc.primaryBlue.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                        child: FutureBuilder(
                          future: GetQuote().getQuote(),
                          builder: (BuildContext context , AsyncSnapshot snapshot)
                          {
                            if (snapshot.data == null) {
                              return  Material(
                                color: mc.background,
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:  [
                                      const SizedBox(
                                        child: CircularProgressIndicator(),
                                        height: 50.0,
                                        width: 50.0,
                                      ),
                                      const SizedBox(height: 40.0,),
                                      wd.putText("Loading Quote ...", 10.0, 4.0, mc.white)
                                    ],
                                  ),
                                ),
                              );
                            }
                            else {
                              return (wd.putQuote('“ \n' +
                                  snapshot.data[0] +
                                  ' ”' + "\n \n - " + snapshot.data[1],
                                  15.0, 2.0, mc.white));
                            }
                          },
                        )
                      ),
                    // Footer
                  const SizedBox(height: 35.0,),
                  wd.footer(),
                ],
              ),
            )
        ),
      ),
    );
  }
}
