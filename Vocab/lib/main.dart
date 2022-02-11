import 'package:flutter/material.dart';
import 'loggercheck.dart';
import 'pages/widgets.dart';
import 'pages/colors.dart';
import 'package:flutter_animated_splash/flutter_animated_splash.dart';

void main() {
  runApp(Vocab());
}

class Vocab extends StatelessWidget{
  // Title
   String title = "VOCAB";
   widgets wd = widgets();
   myColors mc = myColors();

  Vocab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context )  => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    home:
    AnimatedSpash(
        type: Transition.fade,
        child:Center(
          child: Column(
            children: [
              const SizedBox(height: 350.0,),
              Icon(Icons.whatshot, size:50.0, color: mc.Red,),
              const SizedBox(height: 20.0,),
              wd.putText(title, 35.0, 25.0, mc.greyText),
            ],
          ),
        ),
      backgroundColor: mc.background,
      durationInSeconds: 3,
      navigator: const LoggerCheck(),
  ));
}

