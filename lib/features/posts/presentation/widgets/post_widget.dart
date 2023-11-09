import 'package:clean_api/core/utils/extensions/buildContextExtension.dart';
import 'package:clean_api/features/posts/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  const PostWidget({
    super.key,
    required this.post,
    required this.onTap,
  });
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: context.width,
            alignment: Alignment.center,
            decoration: const BoxDecoration(color: Colors.black),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.width / 30,
                  vertical: context.height / 70),
              child: Text(
                post.title.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            post.body,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: context.height / 60,
          ),
        ],
      ),
    );
  }
}
