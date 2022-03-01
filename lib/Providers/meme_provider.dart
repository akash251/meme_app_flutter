import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meme_app_flutter/Models/meme_model.dart';
import 'package:dio/dio.dart';

final memeProvider = StateNotifierProvider<MemeProvider,Meme>((ref) {
  return MemeProvider();
});

class MemeProvider extends StateNotifier<Meme>{
  MemeProvider() : super(Meme(postLink: '', title: '', url: 'https://cdn2.vectorstock.com/i/1000x1000/58/31/loading-icon-on-black-vector-24545831.jpg', author: '')){
    getMeme();
  }
  Future<void> getMeme() async{
    final dio = Dio();
    try{
      final response = await dio.get('https://meme-api.herokuapp.com/gimme');
      final pl = (response.data['postLink']);
      final url = response.data['url'];
      final title = response.data['title'];
      final author = response.data['author'];

      state = Meme(postLink: pl,url: url,title: title,author: author);
    }on DioError catch(error){}
  }
}