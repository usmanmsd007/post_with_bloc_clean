import 'package:clean_api/core/error/failures.dart';
import 'package:clean_api/core/use_cases/useCases.dart';
import 'package:clean_api/features/post_with_comments/domain/entities/comment.dart';
import 'package:clean_api/features/post_with_comments/domain/repositories/post_repository.dart';

import 'package:dartz/dartz.dart';

class GetComments extends UseCase<List<Comment>, CommentParams> {
  final PostWithCommentRepository repository;
  GetComments({required this.repository});

  @override
  Future<Either<Failure, List<Comment>>> call(CommentParams params) async {
    return await repository.getComments(params.postId);
  }
}
class CommentParams{
final int postId;
const CommentParams(this.postId);
}