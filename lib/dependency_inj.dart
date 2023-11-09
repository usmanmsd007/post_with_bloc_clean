import 'dart:developer';

import 'package:clean_api/core/network/network_info.dart';
import 'package:clean_api/features/post_with_comments/data/datasources/remote_data_source.dart';
import 'package:clean_api/features/post_with_comments/data/repositories/post_with_comment_rep_impl.dart';
import 'package:clean_api/features/post_with_comments/domain/repositories/post_repository.dart';
import 'package:clean_api/features/post_with_comments/domain/usecases/get_comments.dart';
import 'package:clean_api/features/post_with_comments/presentation/bloc/post_with_comments_bloc.dart';
import 'package:clean_api/features/posts/data/datasources/remote_data_source.dart';
import 'package:clean_api/features/posts/data/repositories/post_repository_impl.dart';
import 'package:clean_api/features/posts/domain/repositories/post_repository.dart';
import 'package:clean_api/features/posts/domain/usecases/get_posts.dart';
import 'package:clean_api/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

initDependencies() {
  sl.registerLazySingleton<PostDataSource>(
      () => PostDataSourceImpl(dio: Dio()));
    log("PostData Source Initielized", name: "In init");

  //  sl.registerLazySingleton<PostWithCommentsDataSource>(()=> PostWithCommentsDataSourceImpl(dio: Dio()));

  sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(sl.get<InternetConnectionChecker>()));

  sl.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(
        postDataSource: sl<PostDataSource>(),
        networkInfo: sl<NetworkInfo>(),
      ));
// sl.registerLazySingleton<PostWithCommentRepository>(()=> PostWithCommentsRepositoryImpl(
//       commentDataSource: sl<PostWithCommentsDataSource>(),
//       networkInfo: sl<NetworkInfo>(),

  // ));
// sl.registerSingleton<GetComments>(GetComments(repository: sl<PostWithCommentRepository>()));
  sl.registerSingleton<GetPosts>(GetPosts(repository: sl<PostRepository>()));

  sl.registerFactory(() => PostsBloc(getPosts: sl.get<GetPosts>()));

  // sl.registerFactory(() => CommentsBloc(
  //       getComments: sl.get<GetComments>()));
}
