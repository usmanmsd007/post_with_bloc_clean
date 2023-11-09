import 'package:clean_api/features/post_with_comments/domain/entities/comment.dart';
import 'package:clean_api/features/posts/domain/entities/post_entity.dart';
import 'package:clean_api/features/posts/presentation/widgets/post_widget.dart';
import 'package:flutter/material.dart';

class PostWithComments extends StatelessWidget {
  const PostWithComments({super.key, required this.post, required this.comments});
  final Post post;
  final List<Comment> comments;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PostWidget(post: post, onTap: () {}),
        SizedBox(
          height: 20,
        ),
        Text("Comments"),
        SizedBox(
          height: 40,
        ),
        Column(children: [
          ...List.generate(comments.length, (index) => Text(comments[index].body))
        ],)
      ],
    );
  }
}
