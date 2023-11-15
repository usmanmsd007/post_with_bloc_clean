import 'dart:developer';

import 'package:clean_api/features/post_with_comments/presentation/bloc/post_with_comments_bloc.dart';
import 'package:clean_api/features/posts/domain/entities/post_entity.dart';
import 'package:clean_api/features/posts/presentation/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PostWithCommentsScreen extends StatelessWidget {
  const PostWithCommentsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final post = GoRouterState.of(context).extra! as Post;

    context.read<CommentsBloc>().add(LoadComments(postId: post.id));
    log(post.title);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PostWidget(post: post, onTap: () {}),
            const SizedBox(
              height: 20,
            ),
            const Text("Comments"),
            const SizedBox(
              height: 40,
            ),
            BlocBuilder<CommentsBloc, CommentState>(
              builder: (context, state) {
                if (state is CommentLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is CommentsCompleted) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        ...List.generate(
                          state.comments.length,
                          (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.comments[index].email,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                              Text(
                                state.comments[index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                  child: Text(
                                state.comments[index].body,
                                maxLines: 4,
                              )),
                              const SizedBox(
                                height: 4,
                              ),
                              const Divider(),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                  //
                } else if (state is CommentsError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
