import 'package:clean_api/core/utils/router/routes.dart';
import 'package:clean_api/features/post_with_comments/presentation/pages/post_with_comments.dart';
import 'package:clean_api/features/posts/presentation/pages/posts_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: POSTS,
      builder: (context, state) => const PostsScreen(),
      routes: [
        GoRoute(
          path: COMMENTS,
          builder: (context, state) {
            return const PostWithCommentsScreen();
          },
        ),
      ],
    ),
  ],
);
