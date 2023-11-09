import 'package:clean_api/core/error/failures.dart';
import 'package:clean_api/core/use_cases/useCases.dart';

import 'package:clean_api/features/posts/domain/entities/post_entity.dart';
import 'package:clean_api/features/posts/domain/usecases/get_posts.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {

  final GetPosts getPosts;

  PostsBloc({ required this.getPosts})
      : super(PostsLoading()) {
    on<PostsEvent>((handlestate));
  }

  Future<void> handlestate(PostsEvent e, Emitter<PostsState> emit) async {
    if (e is LoadPosts) {
      emit(PostsLoading());
      final failureOrPosts = await getPosts(NoParams());

      emit(failureOrPosts.fold(
          (error) => PostsError(
                message: _mapFailureToMessage(error),
              ),
          (posts) => PostsCompleted(posts: posts)));
    }

    }






  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Sorry there was a server error";
      case NoInternetFailure:
        return "Sorry No Internet Connection";
      default:
        return 'Unexpected error';
    }
  }
  }


