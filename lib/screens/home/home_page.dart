import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wynd_test/blocs/post_bloc/post_cubit.dart';
import 'package:wynd_test/blocs/post_bloc/post_cubit_state.dart';
import 'package:wynd_test/constants/ui_contants.dart';
import 'package:wynd_test/screens/home/widgets/post_container.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final postCubit = PostCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(commonPadding),
        child:
            BlocBuilder<PostCubit, PostCubitState>(builder: (context, state) {
          if (state is PostListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PostListLoaded) {
            return ListView.builder(
              itemCount: state.postList.length,
              itemBuilder: (_, i) {
                return PostContainer(state.postList[i]);
              },
            );
          }
          if (state is PostListLoadError) {
            return Center(
              child: Text(state.errorString),
            );
          }
          return Container();
        }),
      ),
    );
  }
}
