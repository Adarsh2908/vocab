import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/wordmodel.dart';
import 'package:dio/dio.dart';
import 'widgets.dart';
import 'colors.dart';
import 'word_details.dart';


class SearchWord{
  final Dio  _dio = Dio();

  Future<List<WordModel>> searchWord(String word) async {
    List<WordModel> list=[];
    try{
      Response response = await _dio.get("https://api.dictionaryapi.dev/api/v2/entries/en/$word");
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
        print(origin);
        print(audioURL);
        print(definition);
        print(sentence);
        print(synonym);
        print(antonyms);
        WordModel wd = WordModel(word,origin,audioURL,definition,sentence,synonym,antonyms);
        list.add(wd);
      }

    }
    on DioError catch(err)
    {
      print(err.message);
    }
    return list;
  }

}
