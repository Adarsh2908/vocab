// Imports
import 'package:dio/dio.dart';

class UserService {
  // Vars , Constructors
  Dio dio = Dio();
  late Response _response;
  late Response _registerresponse;
  late Response _existsRes;

  //  *********  Functions *********
  // User Login
  Future<int> login(String email, String password) async {
    try {
      _response = await dio.post("http://192.168.1.9:3000/user/login",
          data: {"email": email, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      return 3;
    }
    if (_response.statusCode == 202) {
      return 1; // Success
    } else if (_response.statusCode == 200) {
      return 2; // User not found
    } else {
      return 0;
    }
  }

  // User Registration
  Future<int> register(var data) async {
    try {
      _registerresponse = await dio.post("http://192.168.1.9:3000/user",
          data: data,
          options: Options(contentType: Headers.formUrlEncodedContentType));

    } on DioError catch (e) {

      return 1;
    }
    if (_registerresponse.statusCode == 400) {
      return 2; // Server Error
    }
    return 3; // Success
  }

  // User Exists Check
  Future<int> exists(String email) async {
    try {
      _existsRes = await dio.post("http://192.168.1.9:3000/user/exists",
          data: {"email":email},
          options: Options(contentType: Headers.formUrlEncodedContentType));

    } on DioError catch (e) {
      print(e.response!.statusCode);
      return 1; // User Doesn't exists
    }
    return 2; // Exists
  }

}
