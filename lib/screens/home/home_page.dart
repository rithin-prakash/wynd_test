import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wynd_test/blocs/post_bloc/post_cubit.dart';
import 'package:wynd_test/blocs/post_bloc/post_cubit_state.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final postCubit = PostCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostCubit>(
      create: (_) => PostCubit()..loadPostList(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
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
                  return Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 1,
                          color: Colors.grey,
                          offset: Offset(1, 2),
                        )
                      ],
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.postList[i].title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            state.postList[i].body,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Post ID: ${state.postList[i].id}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                'User ID: ${state.postList[i].userId}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
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
      ),
    );
  }
}
