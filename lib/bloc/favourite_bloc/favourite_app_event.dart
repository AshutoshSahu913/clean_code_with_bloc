import 'package:clean_code_with_bloc/models/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object?> get props => [];
}

class FetchFavouriteEvent extends FavouriteEvent {}

class FavouriteItem extends FavouriteEvent {
  // this item creating for updated value of model
  final FavouriteItemModel item;

  const FavouriteItem({required this.item});
}

class SelectItem extends FavouriteEvent {
  final FavouriteItemModel item;

  const SelectItem({required this.item});
}

class UnSelectItem extends FavouriteEvent {
  final FavouriteItemModel item;

  const UnSelectItem({required this.item});
}

class RemoveItem extends FavouriteEvent {
  final FavouriteItemModel removeItem;

  const RemoveItem({required this.removeItem});
}
