import 'package:clean_api/features/posts/domain/entities/post_entity.dart';

class PostModel extends Post {
  const PostModel({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) : super(body: body, title: title, id: id, userId: userId);

 

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
