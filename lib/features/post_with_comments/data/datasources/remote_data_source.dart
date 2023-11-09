import 'package:clean_api/core/error/exceptions.dart';
import 'package:clean_api/features/post_with_comments/data/models/comment_model.dart';

import 'package:dio/dio.dart';

abstract class PostWithCommentsDataSource {
 
  /// Calls the https://jsonplaceholder.typicode.com/posts/$postId/comments endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<CommentModel>> getComments(int postId);
}

class PostWithCommentsDataSourceImpl extends PostWithCommentsDataSource {
  final Dio dio;

  PostWithCommentsDataSourceImpl({
    required this.dio,
  });
  @override
  Future<List<CommentModel>> getComments(int postId) async {
    final Response response = await dio
        .get('https://jsonplaceholder.typicode.com/posts/$postId/comments');
    if (response.statusCode == 200) {
      List<CommentModel> c = [];
      response.data.forEach((i) {
        c.add(CommentModel.fromJson(i));
      });

      return c;
    } else {
      throw ServerException();
    }
  }

 
}
