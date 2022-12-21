import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wynd_test/blocs/post_detail_bloc/post_detail_cubit_state.dart';
import 'package:wynd_test/core/repository.dart';

class PostDetailCubit extends Cubit<PostDetailCubitState> {
  PostDetailCubit() : super(PostListLoadInitial());

  void loadPostDetail(int id) async {
    emit(PostLoading());

    try {
      var res = await Repository.instance.getPostDetails(id);

      emit(PostLoaded(res));
    } catch (e) {
      emit(PostLoadError(e.toString()));
    }
  }
}
