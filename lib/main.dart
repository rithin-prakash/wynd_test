import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wynd_test/blocs/comment_bloc/comment_bloc.dart';
import 'package:wynd_test/blocs/post_bloc/post_cubit.dart';
import 'package:wynd_test/blocs/post_detail_bloc/post_detail_cubit.dart';
import 'package:wynd_test/core/route_generator.dart';
import 'package:wynd_test/screens/splashscreen/splashscreen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => PostCubit()..loadPostList()),
          BlocProvider(create: (_) => PostDetailCubit()),
          BlocProvider(create: (_) => CommentCubit())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          onGenerateRoute: RouteGenerator.generateRoute,
          // initialRoute: RouteName.home,
          home: SplashscreenPage(),
        ));
  }
}
