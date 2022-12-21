import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wynd_test/blocs/comment_bloc/comment_state.dart';
import 'package:wynd_test/core/repository.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(CommentInitial());

  Future<void> loadComments(int id) async {
    emit(CommentLoading());

    try {
      var res = await Repository.instance.getPostComment(id);

      emit(CommentLoaded(res));
    } catch (e) {
      emit(CommentError(e.toString()));
    }
  }
}
