import 'package:clean_api/core/error/failures.dart';
import 'package:clean_api/features/post_with_comments/domain/entities/comment.dart'; 
import 'package:dartz/dartz.dart';

abstract class PostWithCommentRepository{
   Future<Either<Failure, List<Comment>>> getComments(int postId); 
}