part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();  

  @override
  List<Object> get props => [];
}
 
class PostsLoading extends PostsState {}
class PostsError extends PostsState {
  final String message;
  const PostsError({required this.message});
}

class PostsCompleted extends PostsState {
  final List<Post> posts;
  const PostsCompleted({required this.posts});
}



 



 
