import 'package:bloc/bloc.dart';
import 'package:clean_code_with_bloc/bloc/post_bloc/post_event.dart';
import 'package:clean_code_with_bloc/bloc/post_bloc/post_state.dart';
import 'package:clean_code_with_bloc/models/post_item_model.dart';
import 'package:clean_code_with_bloc/repository/post_repository.dart';
import 'package:clean_code_with_bloc/utils/enums.dart';

class PostBloc extends Bloc<UserPostEvent, PostStates> {
  List<PostModel> tempPostList = [];

  final PostRepository _postRepository;

  PostBloc(this._postRepository) : super(const PostStates()) {
    on<FetchPost>(_fetchPostList);
    on<FilterEvent>(_filterPostList);
  }

  void _fetchPostList(FetchPost event, Emitter<PostStates> emit) async {
    emit(state.copyWith(status: PostStatus.loading));

    try {
      final comments = await _postRepository.fetchPost();
      emit(state.copyWith(status: PostStatus.success, list: comments));
    } catch (e) {
      emit(state.copyWith(status: PostStatus.failure, message: e.toString()));
    }
  }

  void _filterPostList(FilterEvent event, Emitter<PostStates> emit) async {
    if (event.searchQuery.isEmpty) {
      emit(state.copyWith(tempList: const [], message: ''));
    } else {
      tempPostList = state.postList
          .where(
            (element) =>
                element.email.toString().contains(event.searchQuery) ||
                element.name.toString().contains(event.searchQuery),
          )
          .toList();
      if (tempPostList.isEmpty) {
        emit(state.copyWith(tempList: tempPostList, message: "No data Found"));
      } else {
        emit(state.copyWith(tempList: tempPostList));
      }
    }
  }
}
