import 'dart:developer';

import 'package:clean_api/core/error/exceptions.dart';
import 'package:clean_api/features/posts/data/models/post_model.dart';
import 'package:dio/dio.dart';

abstract class PostDataSource {
  /// Calls the https://jsonplaceholder.typicode.com/posts/ endpoint.
  ///
  /// Throws a [ServerException] for all other error codes.
  Future<List<PostModel>> getPosts();

}

class PostDataSourceImpl extends PostDataSource {
  final Dio dio;

  PostDataSourceImpl({
    required this.dio,
  }){
    log("PostData Source Initielized");
  }


  @override
  Future<List<PostModel>> getPosts() async {
    final Response response =
        await dio.get('https://jsonplaceholder.typicode.com/posts/');
    if (response.statusCode == 200) {
      List<PostModel> l = [];
      response.data.forEach((i) {
        l.add(PostModel.fromJson(i));
      });

      return l;
    } else {
      throw ServerException();
    }
  }
}
