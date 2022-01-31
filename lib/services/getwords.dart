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

    int last = 10, index = 0;
    for(int i = 0; i<last; i++) {
      try{
        Response response = await _dio.get("https://api.dictionaryapi.dev/api/v2/entries/en/${words[i]}");
        if(response.statusCode != 404)
          {
            print(response.data[0]['word']);
            WordModel wd = WordModel(response.data[0]['word']);
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