import 'package:clean_code_with_bloc/models/post_item_model.dart';
import 'package:clean_code_with_bloc/utils/enums.dart';
import 'package:equatable/equatable.dart';

class PostStates extends Equatable {
  // this is for fetch posts
  final List<PostModel> postList;
  final PostStatus postStatus;
  final String message;

  // this is for apply filter
  // create temp list
  final List<PostModel> tempList;
  final String searchMessage;

  //this is initial state of this
  const PostStates({
    this.postStatus = PostStatus.loading,
    this.postList = const [],
    this.message = "",
    this.tempList = const [],
    this.searchMessage = "",
  });

  // when update or rebuild list the this func update
  PostStates copyWith({
    PostStatus? status,
    List<PostModel>? list,
    String? message,
    List<PostModel>? tempList,
    String? searchMessage,
  }) {
    return PostStates(
      postList: list ?? this.postList,
      postStatus: status ?? this.postStatus,
      message: message ?? this.message,
      tempList: tempList ?? this.tempList,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  List<Object?> get props => [postStatus, postList, message, tempList,searchMessage];
}
