import 'package:clean_api/core/utils/router/router.dart';
import 'package:clean_api/dependency_inj.dart';
import 'package:clean_api/features/post_with_comments/presentation/bloc/post_with_comments_bloc.dart';
import 'package:clean_api/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostsBloc>(
          create: (_) => sl<PostsBloc>(),
        ),
          BlocProvider<CommentsBloc>(
          create: (_) => sl<CommentsBloc>(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
