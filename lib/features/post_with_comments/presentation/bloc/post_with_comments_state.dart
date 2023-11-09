part of 'post_with_comments_bloc.dart';

abstract class CommentState extends Equatable {
  const CommentState();  

  @override
  List<Object> get props => [];
}
 

class CommentsError extends CommentState{
  final String message;

  const CommentsError({required this.message, });
}

class CommentLoading extends CommentState{

  const CommentLoading();
}



class CommentsCompleted extends CommentState {
  
  final List<Comment> comments;
  const CommentsCompleted({required this.comments, });
}
