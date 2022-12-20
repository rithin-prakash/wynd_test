import 'package:equatable/equatable.dart';
import 'package:wynd_test/models/post.dart';

abstract class PostCubitState extends Equatable {}

class PostListLoadInitial extends PostCubitState {
  @override
  List<Object?> get props => [];
}

class PostListLoading extends PostCubitState {
  @override
  List<Object?> get props => [];
}

class PostListLoaded extends PostCubitState {
  final List<Post> postList;

  PostListLoaded(this.postList);

  @override
  List<Object?> get props => [postList];
}

class PostListLoadError extends PostCubitState {
  final String errorString;

  PostListLoadError(this.errorString);

  @override
  List<Object?> get props => [errorString];
}
