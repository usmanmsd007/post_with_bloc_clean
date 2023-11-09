part of 'post_with_comments_bloc.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

  

  class LoadComments extends CommentEvent{
  final int postId;

  const LoadComments({required this.postId});

}
