import 'dart:developer';

import 'package:clean_api/core/utils/extensions/buildContextExtension.dart';
import 'package:clean_api/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:clean_api/features/posts/presentation/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PostsBloc>().add(LoadPosts());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Posts",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            if (state is PostsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PostsCompleted) {
              return ListView.builder(
                itemBuilder: (c, i) => Column(
                  children: [
                    PostWidget(
                      post: state.posts[i],
                      onTap: () {
                        log("hello world", name: "On tap");
                        // context
                        //     .read<PostsBloc>()
                        //     .add(LoadComments(post: state.posts[i]));
                      },
                    ),
                    SizedBox(
                      height: context.height / 80,
                    )
                  ],
                ),
                itemCount: state.posts.length,
              );
            }  else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
