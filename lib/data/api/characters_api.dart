// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:learning_app/constants/strings.dart';


class CharactersApi {
  late Dio dio;

  CharactersApi(){
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20*1000,
      receiveTimeout: 20*1000,
    );
    dio = Dio(options);
  }

  Future <List<dynamic>> getCharacters () async {
    try{
      Response response = await dio.get('characters');
      print(response.data.toString());
      return response.data;
    }catch(e){
      print(e.toString());
      return [];
    }
  }
}