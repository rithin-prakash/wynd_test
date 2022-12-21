import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wynd_test/blocs/comment_bloc/comment_bloc.dart';
import 'package:wynd_test/blocs/comment_bloc/comment_state.dart';
import 'package:wynd_test/constants/ui_contants.dart';
import 'package:wynd_test/screens/post/widgets/comment_container.dart';

class CommentListContainer extends StatelessWidget {
  const CommentListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: commonPadding),
      child: BlocBuilder<CommentCubit, CommentState>(builder: (_, state) {
        if (state is CommentLoading) {
          return Column(
            children: [
              Container(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(),
              ),
              Spacer()
            ],
          );
        }
        if (state is CommentLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Comments - ${state.commentList.length}',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.orange),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.commentList.length,
                  itemBuilder: (_, i) => CommentContainer(state.commentList[i]),
                ),
              ),
            ],
          );
        }
        if (state is CommentError) return Text(state.errorString);
        return Container();
      }),
    );
  }
}
