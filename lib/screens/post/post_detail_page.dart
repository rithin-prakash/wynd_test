import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wynd_test/blocs/comment_bloc/comment_bloc.dart';
import 'package:wynd_test/blocs/post_detail_bloc/post_detail_cubit.dart';
import 'package:wynd_test/blocs/post_detail_bloc/post_detail_cubit_state.dart';
import 'package:wynd_test/models/post.dart';
import 'package:wynd_test/screens/post/widgets/comment_list_container.dart';
import 'package:wynd_test/screens/post/widgets/post_detail_container.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage(this.post, {super.key});

  final Post post;

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<PostDetailCubit>(context).loadPostDetail(widget.post.id);
    BlocProvider.of<CommentCubit>(context).loadComments(widget.post.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BlocBuilder<PostDetailCubit, PostDetailCubitState>(
                builder: (_, state) {
              if (state is PostLoading) {
                return const CircularProgressIndicator();
              }
              if (state is PostLoaded) return PostDetailContainer(state.post);
              if (state is PostLoadError) return Text(state.errorString);
              return Container();
            }),
            const Divider(thickness: 2),
            const Expanded(
              child: CommentListContainer(),
            ),
          ],
        ),
      ),
    );
  }
}
