import 'package:flutter/material.dart';
import 'colors.dart';
import 'widgets.dart';

class WordDetails extends StatelessWidget {
  final String word;
  const WordDetails({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Constructors
    final myColors mc = myColors();
    final widgets wd = widgets();

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
              // Word + Hindi
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                wd.putText(word.toUpperCase(), 22.0, 3.0, mc.greyText),
                  Icon(Icons.double_arrow_outlined,color: mc.white,),
                  wd.putText("Hindi", 22.0, 2.0, mc.primaryBlue)
              ],
              ),
              // Pronuntiation
              const SizedBox(height: 30.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  wd.putText("Pronunciation".toUpperCase(), 17.0, 3.0, mc.greyText),
                  SizedBox(width: 20.0,),
                  InkWell(
                    onTap: ()=>{},
                    child: Icon(Icons.headphones,color: mc.Green,),
                  )
                ],
              ),
              // Origin
              const SizedBox(height: 30.0,),

              Container(
                height: 100.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: mc.Blue,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(13.0,11.0,10.0,0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wd.putText("ORIGIN", 18.0, 2.0, mc.primaryBlue),
                      const SizedBox(height: 15.0,),
                      wd.putText("DUMMY this was originated from all over the word.", 11.0, 2.0, mc.white)
                    ],
                  ),
                ),

              ),

              // Definition Example

              const SizedBox(height: 20.0,),

              Container(
                height: 230.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: mc.TransRed,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(13.0,11.0,10.0,0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wd.putText("DEFINITION", 18.0, 2.0, mc.Red),
                      const SizedBox(height: 15.0,),
                      wd.putText("This was originated from all over the word for sake of this and that.", 11.0, 2.0, mc.white),
                      const SizedBox(height: 40.0,),

                      wd.putText("SENTENCE", 18.0, 2.0, mc.Red),
                      const SizedBox(height: 15.0,),
                      wd.putText("This was originated from all over the word.", 11.0, 2.0, mc.white)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),

              Container(
                height: 100.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: mc.lightOrange,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(13.0,12.0,10.0,0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                          wd.putText("SYNONYMS", 18.5, 2.0, Colors.deepPurpleAccent),
                      const SizedBox(height: 14.0,),
                      wd.putText("This , That , Howdy, Catchy ", 12.0, 2.0, mc.white)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),

              Container(
                height: 100.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: mc.lightGreen,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(13.0,12.0,10.0,0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wd.putText("ANTONYMS", 18.5, 2.0, Colors.green),
                      const SizedBox(height: 14.0,),
                      wd.putText("This , That , Howdy, Catchy ", 12.0, 2.0, mc.white)
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
