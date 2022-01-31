import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'widgets.dart';
import '../services/getwords.dart';

class SavedWords extends StatefulWidget {
  const SavedWords({Key? key}) : super(key: key);

  @override
  _SavedWordsState createState() => _SavedWordsState();
}

class _SavedWordsState extends State<SavedWords> {
  // Constructors
  myColors mc = myColors();
  widgets wd = widgets();
  int words = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetWords().getWords(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                  wd.putText("LOADING WORDS ...", 18.0, 5.0, mc.white)
                ],
              ),
            ),
          );
        } else {
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
                        Icon(
                          Icons.star,
                          color: mc.Green,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        wd.putText("FAVORITES", 20.0, 3.0, mc.greyText),
                      ],
                    ),
                    SizedBox(height: 30.0,),
                    // Words
                    //   showWords(snapshot),
                    SingleChildScrollView(
                      physics: ScrollPhysics(),
                      child: Column(
                        children: <Widget>[
                          ListView.builder(

                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:snapshot.data.length,
                              itemBuilder: (context,index){
                                return  showWords(snapshot.data[index].word, index);
                              }),
                         const SizedBox(height: 20.0,)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
 showWords(String title, int index)
  {
           return ( wd.wordCardSaved(
                title,
                "Hindi",
                "This Means all of this is nice.",
                index,
                MediaQuery.of(context).size.width,
               context));
  }
}
