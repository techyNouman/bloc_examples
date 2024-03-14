
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import '../../model/Posts.dart';

class PostsRepository {

  Future<List<Posts>> fetchPost()async{

    try {

      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts')).timeout( const Duration(seconds: 10 ));
      final body = json.decode(response.body) as List;
      if (kDebugMode) {
        print(response.statusCode.toString());
        print(body);
      }

      if(response.statusCode == 200){
        return  body.map((dynamic json) {
          final map = json as Map<String, dynamic>;
          return  Posts(
            userId: map['userId'] as int ?? 0,
            id: map['id'] as int,
            title: map['title'] as String,
            body: map['body'] as String,
          );
        }).toList();

      }

    } on SocketException {
      await Future.delayed(const Duration(milliseconds: 1800));
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception('');
    }

    throw Exception('error fetching data');
  }

}
