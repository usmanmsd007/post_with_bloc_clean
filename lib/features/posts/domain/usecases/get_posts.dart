import 'package:clean_api/core/error/failures.dart';
import 'package:clean_api/core/use_cases/useCases.dart';
import 'package:clean_api/features/posts/domain/entities/post_entity.dart';
import 'package:clean_api/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class GetPosts extends UseCase<List<Post>, NoParams> {
  final PostRepository repository;
  GetPosts({required this.repository});

  @override
  Future<Either<Failure, List<Post>>> call(NoParams params) async {
    return await repository.getPosts();
  }
}
