import 'package:flutter/material.dart';
import 'colors.dart';
import 'widgets.dart';
import '../services/audio_player.dart';

class WordDetails extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final index;
  const WordDetails({Key? key, required this.snapshot, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Constructors
    final myColors mc = myColors();
    final widgets wd = widgets();
    final dynamic word = snapshot.data[index].word;
    final dynamic origin = snapshot.data[index].origin;
    final dynamic definition = snapshot.data[index].definition;
    final dynamic sentence = snapshot.data[index].sentence;
    final List synonym = snapshot.data[index].synonym;
    final List antonym = snapshot.data[index].antonym;
    final String syno = synonym.join(" , ");
    final String anto = antonym.join(" , ");

    // Vars

    return Scaffold(
      backgroundColor: mc.Grey,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: mc.Grey,
        title: wd.Header(),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              // Word
                wd.putText(word.toUpperCase(), 23.0, 3.0, mc.primaryBlue),

              // Pronuntiation
              const SizedBox(height: 30.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  wd.putText("Pronunciation".toUpperCase(), 17.0, 3.0, mc.greyText),
                  const SizedBox(width: 20.0,),
                  InkWell(
                    onTap: ()  =>{
                      WordPlayer().playWord(word),
                    },
                    child: Icon(Icons.headphones,color: mc.Green,),
                  )
                ],
              ),
              // Origin
              const SizedBox(height: 30.0,),

              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: mc.Blue,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wd.putText("ORIGIN", 18.0, 2.0, mc.primaryBlue),
                      const SizedBox(height: 15.0,),
                      wd.putText(origin, 11.0, 2.0, mc.white)
                    ],
                  ),
                ),

              ),

              // Definition Example

              const SizedBox(height: 20.0,),

              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: mc.TransRed,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wd.putText("DEFINITION", 18.0, 2.0, mc.Red),
                      const SizedBox(height: 15.0,),
                      wd.putText(definition, 11.0, 2.0, mc.white),
                      const SizedBox(height: 40.0,),

                      wd.putText("SENTENCE", 18.0, 2.0, mc.Red),
                      const SizedBox(height: 15.0,),
                      wd.putText(sentence, 11.0, 2.0, mc.white)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),

              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: mc.lightOrange,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                          wd.putText("SYNONYMS", 18.5, 2.0, Colors.deepPurpleAccent),
                      const SizedBox(height: 14.0,),
                      wd.putText(syno, 12.0, 2.0, mc.white)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),

              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: mc.lightGreen,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wd.putText("ANTONYMS", 18.5, 2.0, Colors.green),
                      const SizedBox(height: 14.0,),

                      wd.putText(anto, 12.0, 2.0, mc.white)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),
              wd.footer()
            ],
          ),
        ),
      ),
    );
  }
}
