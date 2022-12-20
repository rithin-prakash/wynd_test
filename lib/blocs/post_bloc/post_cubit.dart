import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wynd_test/blocs/post_bloc/post_cubit_state.dart';
import 'package:wynd_test/core/repository.dart';

class PostCubit extends Cubit<PostCubitState> {
  PostCubit() : super(PostListLoadInitial());

  void loadPostList() async {
    emit(PostListLoading());

    try {
      var res = await Repository.instance.getPosts();

      emit(PostListLoaded(res));
    } catch (e) {
      emit(PostListLoadError(e.toString()));
    }
  }
}
