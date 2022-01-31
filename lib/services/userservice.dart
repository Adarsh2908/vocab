import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../models/users.dart';

class UserService{
  Dio dio = Dio();
  createUser(Users user) async
  {
    Response response;
    try {
      response = await dio.get('http://www.google.com');
      print(response);
    } on DioError catch(e)
    {
      print(e.message);
    }
  }

}
