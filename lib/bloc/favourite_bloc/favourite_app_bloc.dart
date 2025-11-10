import 'package:bloc/bloc.dart';
import 'package:clean_code_with_bloc/bloc/favourite_bloc/favourite_app_event.dart';
import 'package:clean_code_with_bloc/bloc/favourite_bloc/favourite_app_state.dart';
import 'package:clean_code_with_bloc/models/favourite_item_model.dart';
import 'package:clean_code_with_bloc/repository/favourite_repo.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteItemModelState> {
  FavouriteRepo favRepo;
  List<FavouriteItemModel> listFavItem = [];

  FavouriteBloc(this.favRepo) : super(const FavouriteItemModelState()) {
    on<FetchFavouriteEvent>(fetchFavouriteItem);
    on<FavouriteItem>(getFavouriteItem);
  }

  void fetchFavouriteItem(
    FetchFavouriteEvent event,
    Emitter<FavouriteItemModelState> emit,
  ) async {
    listFavItem = await favRepo.fetchItem();
    emit(
      state.copyWith(
        favItemList: List.from(listFavItem),
        listStatus: ListStatus.success,
      ),
    );
  }

  void getFavouriteItem(
    FavouriteItem event,
    Emitter<FavouriteItemModelState> emit,
  ) async {
    final item = listFavItem.indexWhere(
      (element) => element.id == event.item.id,
    );
    listFavItem[item] = event.item;
    emit(state.copyWith(favItemList: List.from(listFavItem)));
  }
}
