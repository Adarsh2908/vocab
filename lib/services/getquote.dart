import 'package:dio/dio.dart';
class GetQuote
{
  Dio dio = Dio();
  Future<List<String>> getQuote() async {
    List<String> data = [];
    try
    {
      Response response = await dio.get('https://zenquotes.io/api/random');
      data.add(response.data[0]['q']);
      data.add(response.data[0]['a']);
    } on DioError catch(e)
    {
      data.add(e.message);
    }
return data;
  }
}