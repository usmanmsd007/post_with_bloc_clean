import 'package:clean_api/core/error/exceptions.dart';
import 'package:clean_api/core/error/failures.dart';
import 'package:clean_api/core/network/network_info.dart';
import 'package:clean_api/features/post_with_comments/data/datasources/remote_data_source.dart';
import 'package:clean_api/features/post_with_comments/domain/entities/comment.dart';
import 'package:clean_api/features/post_with_comments/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class PostWithCommentsRepositoryImpl implements PostWithCommentRepository {
  final PostWithCommentsDataSource commentDataSource;
  final NetworkInfo networkInfo;

  PostWithCommentsRepositoryImpl(
      {required this.commentDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Comment>>> getComments(int postId) async {
    if (await networkInfo.isConnected) {
      try {
        final comments = await commentDataSource.getComments(postId);

        return Right(comments);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetFailure());
    }
  }
}
