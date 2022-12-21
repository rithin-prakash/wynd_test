import 'package:equatable/equatable.dart';

import 'package:wynd_test/models/post_detail.dart';

abstract class PostDetailCubitState extends Equatable {}

class PostListLoadInitial extends PostDetailCubitState {
  @override
  List<Object?> get props => [];
}

class PostLoading extends PostDetailCubitState {
  @override
  List<Object?> get props => [];
}

class PostLoaded extends PostDetailCubitState {
  final PostDetail post;

  PostLoaded(this.post);

  @override
  List<Object?> get props => [post];
}

class PostLoadError extends PostDetailCubitState {
  final String errorString;

  PostLoadError(this.errorString);

  @override
  List<Object?> get props => [errorString];
}
