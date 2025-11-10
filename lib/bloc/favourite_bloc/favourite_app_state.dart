import 'package:clean_code_with_bloc/models/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus { loading, success, failure }

class FavouriteItemModelState extends Equatable {
  final List<FavouriteItemModel>? favItemList;
  final ListStatus? listStatus;

  const FavouriteItemModelState({
    this.favItemList = const [],
    this.listStatus = ListStatus.loading,
  });

  FavouriteItemModelState copyWith({
    List<FavouriteItemModel>? favItemList,
    ListStatus? listStatus,
  }) {
    return FavouriteItemModelState(
      favItemList: favItemList ?? this.favItemList,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  List<Object?> get props => [favItemList];
}
