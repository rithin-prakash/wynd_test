import 'package:equatable/equatable.dart';

import 'package:wynd_test/models/comment.dart';

abstract class CommentState extends Equatable {}

class CommentInitial extends CommentState {
  @override
  List<Object?> get props => [];
}

class CommentLoading extends CommentState {
  @override
  List<Object?> get props => [];
}

class CommentLoaded extends CommentState {
  final List<Comment> commentList;

  CommentLoaded(this.commentList);

  @override
  List<Object?> get props => [commentList];
}

class CommentError extends CommentState {
  final String errorString;

  CommentError(this.errorString);

  @override
  List<Object?> get props => [errorString];
}
