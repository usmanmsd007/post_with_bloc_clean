import 'dart:developer';

import 'package:clean_api/core/error/exceptions.dart';
import 'package:clean_api/core/error/failures.dart';
import 'package:clean_api/core/network/network_info.dart';
import 'package:clean_api/features/posts/data/datasources/remote_data_source.dart';
import 'package:clean_api/features/posts/domain/entities/post_entity.dart';
import 'package:clean_api/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDataSource postDataSource;
  final NetworkInfo networkInfo;

  PostRepositoryImpl(
      {required this.postDataSource, required this.networkInfo}) {
    log("PostData Source Initielized", name: "Now Initialized");
  }

  @override
  Future<Either<Failure, List<Post>>> getPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final posts = await postDataSource.getPosts();

        return Right(posts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetFailure());
    }
  }
}
