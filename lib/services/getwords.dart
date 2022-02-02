import 'dart:convert';

import 'dart:io';
import 'package:Vocab/models/wordmodel.dart';
import 'package:flutter/services.dart' show ByteData , rootBundle;
import 'package:dio/dio.dart';

class GetWords
{
  // Constructors
  final Dio  _dio = Dio();
    Future<List<WordModel>> getWords() async {
      List<WordModel> wordList=[];
    String data = await rootBundle.loadString('words/words.txt');
    int i = 0;
    List words = [];
    LineSplitter.split(data).forEach((element) {
      words.insert(i, element);
      i++;
    });
    // Getting Response of all the words

    int last = 4, index = 0;
    for(int i = 0; i<last; i++) {
      Future.delayed(const Duration(milliseconds: 100));
      try{
        Response response = await _dio.get("https://api.dictionaryapi.dev/api/v2/entries/en/${words[i]}");
        if(response.statusCode != 404)
          {
            dynamic word = response.data[0]['word'];
            word= (word==null) ? "Not found":word;
            dynamic origin = response.data[0]['origin'];
            origin = (origin==null) ? "Not Found":origin;
            dynamic audioURL = response.data[0]['phonetics'][0]['audio'];
            audioURL = (audioURL==null) ? "Not Found":audioURL;
            dynamic definition = response.data[0]['meanings'][0]['definitions'][0]['definition'];
            definition = (definition==null) ? "Not Found":definition;
            dynamic sentence = response.data[0]['meanings'][0]['definitions'][0]['example'];
            sentence = (sentence==null) ? "No Related Sentence Found.":sentence;
            List synonym = response.data[0]['meanings'][0]['definitions'][0]['synonyms'];
            if(synonym.isEmpty) synonym.add("No Synonym found.");
            List antonyms = response.data[0]['meanings'][0]['definitions'][0]['antonyms'];
            if(antonyms.isEmpty) antonyms.add("No Antonyms found.");
            print(word);
          // print(origin);
          // print(audioURL);
          // print(definition);
          // print(sentence);
          // print(synonym);
          // print(antonyms);
            WordModel wd = WordModel(word,origin,audioURL,definition,sentence,synonym,antonyms);
            wordList.insert(index , wd);
            index++;
          }
        // Save the Response to wordList

      }
      on DioError catch(err)
      {
        last++;
      }
    }
    // Printing Response
    // for(int i = 0; i<2; i++)
    //   {
    //     print(wordList[i].data[0]['word']);
    //     print(wordList[i].data[0]['meanings'][0]['definitions'][0]['definition']);
    //   }
    return wordList;
  }

}