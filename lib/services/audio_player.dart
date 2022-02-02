import 'package:flutter_tts/flutter_tts.dart';

class WordPlayer{
  final FlutterTts flutterTts = FlutterTts();

 Future playWord(String word) async{
   try{
     await flutterTts.speak(word);
   }
   catch(e)
   {
     print(e);
   }

  }
}