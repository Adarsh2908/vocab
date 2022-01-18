import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'widgets.dart';
import 'homepage.dart';
class ReportError extends StatefulWidget {
  const ReportError({Key? key}) : super(key: key);

  @override
  _ReportErrorState createState() => _ReportErrorState();
}

class _ReportErrorState extends State<ReportError> {
  @override
  Widget build(BuildContext context) {
    // Constructors
    myColors mc = myColors();
    widgets wd = widgets();
    // VALUES
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _feedBack = TextEditingController();
    return Scaffold(
        backgroundColor: mc.Grey,
        appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: mc.Grey,
        title: wd.Header(),
    ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0,90.0,20.0,10.0),
            child: Column(
              children: [
                  wd.putText("BUG REPORT", 25.0, 3.0, mc.greyText),
                const SizedBox(height: 45.0,),
                wd.putText("ENTER YOUR ISSUE BELOW", 15.0, 3.0, mc.white),
                const SizedBox(height: 25.0,),

                Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _feedBack,
                      decoration: wd.inputDecoration("Enter Issue Here", Icon(Icons.pending_actions_outlined,color: mc.Red,)),
                      maxLines: 5,
                      style: TextStyle(color: mc.white),
                      keyboardType: TextInputType.visiblePassword,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please Enter your issue";
                        } else {
                          return null;
                        }
                      },
                    )
                ),
                const SizedBox(height: 20.0,),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10.0),
                        primary: mc.Red,
                        fixedSize: const Size(240,44)
                    ),
                    onPressed: () =>{
                      if (_formKey.currentState!.validate())
                        {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            const SnackBar(
                                content:
                                Text('Feedback SENT'),
                              backgroundColor: Colors.green,
                            ),
                          ),
                          // Go to OTP Page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage()),
                          )
                        }
                    },
                    child:  Text("SEND",
                        style: GoogleFonts.montserrat(
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.w500
                        ))
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
