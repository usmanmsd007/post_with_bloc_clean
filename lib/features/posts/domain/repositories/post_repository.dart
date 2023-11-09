import 'package:clean_api/core/error/failures.dart';

import 'package:clean_api/features/posts/domain/entities/post_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository{
   Future<Either<Failure, List<Post>>> getPosts(); 

}