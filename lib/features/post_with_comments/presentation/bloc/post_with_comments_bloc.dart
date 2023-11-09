import 'package:clean_api/core/error/failures.dart';
 
import 'package:clean_api/features/post_with_comments/domain/entities/comment.dart';
import 'package:clean_api/features/post_with_comments/domain/usecases/get_comments.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_with_comment_event.dart';
part 'post_with_comments_state.dart';

class CommentsBloc extends Bloc<CommentEvent, CommentState> {
  final GetComments getComments;



  CommentsBloc({required this.getComments, })
      : super(const CommentLoading()) {
    on<CommentEvent>((handlestate));
  }

  Future<void> handlestate(CommentEvent e, Emitter<CommentState> emit) async {
    

    if (e is LoadComments) {

      final failureOrPosts =
          await getComments(CommentParams(e.postId));

      emit(failureOrPosts.fold(
          (error) => CommentsError(

                message: _mapFailureToMessage(error),
              ),
          (comments) => CommentsCompleted( comments: comments)));
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

