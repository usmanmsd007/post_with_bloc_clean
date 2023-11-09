import 'package:clean_api/features/post_with_comments/domain/entities/comment.dart';

class CommentModel extends Comment {
  const CommentModel(
      {required int postId,
      required int id,
      required String name,
      required String email,
      required String body})
      : super(body: body, id: id, name: name, email: email, postId: postId);

  @override
  CommentModel copyWith({
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body,
  }) =>
      CommentModel(
        postId: postId ?? this.postId,
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        body: body ?? this.body,
      );

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );
}
