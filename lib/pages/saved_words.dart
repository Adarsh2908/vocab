import 'package:flutter/material.dart';
import 'colors.dart';
import 'widgets.dart';

class SavedWords extends StatefulWidget {
  const SavedWords({Key? key}) : super(key: key);

  @override
  _SavedWordsState createState() => _SavedWordsState();
}

class _SavedWordsState extends State<SavedWords> {
  // Constructors
  myColors mc = myColors();
  widgets wd = widgets();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mc.background,
      appBar: AppBar(
        backgroundColor: mc.background,
        elevation: 0,
        centerTitle: true,
        title: wd.Header(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Title Saved Words
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star,color: mc.Green,),
                  const SizedBox(width: 10.0,),
                  wd.putText("FAVORITES", 20.0, 3.0, mc.greyText),
                ],
              ),
              // Words

              // Words List
              const SizedBox(height: 25.0,),
              wd.wordCardSaved("Arise", "Hindi" , "This Means all of this is nice.", 1, MediaQuery.of(context).size.width,context),
              const SizedBox(height: 15.0,),
              wd.wordCardSaved("Atrocity", "Hindi" , "This Means all of this is nice.", 2, MediaQuery.of(context).size.width,context),
              const SizedBox(height: 25.0,),
              wd.wordCardSaved("Arise", "Hindi" , "This Means all of this is nice.", 1, MediaQuery.of(context).size.width,context),
              const SizedBox(height: 15.0,),
              wd.wordCardSaved("Atrocity", "Hindi" , "This Means all of this is nice.", 2, MediaQuery.of(context).size.width,context),
              const SizedBox(height: 25.0,),
              wd.wordCardSaved("Arise", "Hindi" , "This Means all of this is nice.", 1, MediaQuery.of(context).size.width,context),
              const SizedBox(height: 15.0,),
              wd.wordCardSaved("Atrocity", "Hindi" , "This Means all of this is nice.", 2, MediaQuery.of(context).size.width,context),


            ],
          ),
        ),
      ),
    );
  }
}
