import 'package:clean_api/features/posts/domain/entities/post_entity.dart';
import 'package:clean_api/features/posts/presentation/widgets/post_widget.dart';
import 'package:flutter/material.dart';

class PostWithLoading extends StatelessWidget {
  const PostWithLoading({super.key, required this.post});
  final Post post;
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
        Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
