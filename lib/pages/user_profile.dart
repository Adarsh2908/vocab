import 'package:flutter/material.dart';
import 'colors.dart';
import 'widgets.dart';

class UserProfile extends StatelessWidget {

  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Constructors
    myColors mc = myColors();
    widgets wd = widgets();

    return Scaffold(
      backgroundColor: mc.background,
      appBar: AppBar(
        backgroundColor: mc.background,
        elevation: 0,
        centerTitle: true,
        title: wd.Header(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           Row(
             children: [
               wd.putImage("1.png", 110.0, 110.0),
               const SizedBox(),

             ],
           )

          ],
        ),
      )
    );
  }
}
