import 'package:flutter/material.dart';

import 'package:wynd_test/models/post_detail.dart';

class PostDetailContainer extends StatelessWidget {
  const PostDetailContainer(this.post, {super.key});

  final PostDetail post;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Post ID: ${post.id.toString()}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Text(
          post.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 8),
        Text(
          post.body,
          style: Theme.of(context).textTheme.bodyLarge,
        )
      ],
    );
  }
}
