import 'package:flutter/material.dart';
import 'package:wynd_test/models/comment.dart';

class CommentContainer extends StatelessWidget {
  const CommentContainer(this.comment, {super.key});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(comment.body),
          const SizedBox(height: 4),
          Text(
            'Name: ${comment.name}',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.amberAccent.shade700),
          ),
          const Divider()
        ],
      ),
    );
  }
}
