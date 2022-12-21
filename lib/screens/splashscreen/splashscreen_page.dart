import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wynd_test/blocs/post_bloc/post_cubit.dart';
import 'package:wynd_test/blocs/post_bloc/post_cubit_state.dart';
import 'package:wynd_test/constants/route_names.dart';

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({super.key});

  @override
  State<SplashscreenPage> createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<PostCubit>(context).loadPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: FlutterLogo(
              size: 200,
            ),
          ),
          BlocConsumer<PostCubit, PostCubitState>(
            builder: (_, state) {
              if (state is PostListLoading) {
                return const CircularProgressIndicator.adaptive();
              }
              return Container();
            },
            listener: (_, state) {
              if (state is PostListLoaded) {
                Navigator.pushReplacementNamed(
                  context,
                  RouteName.home,
                );
              }
            },
            listenWhen: (previous, current) => previous != current,
          )
        ],
      ),
    );
  }
}
