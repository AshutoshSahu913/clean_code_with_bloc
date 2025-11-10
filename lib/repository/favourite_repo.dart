import 'package:clean_code_with_bloc/models/favourite_item_model.dart';

class FavouriteRepo {
  Future<List<FavouriteItemModel>> fetchItem() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.of(_generateList(20));
  }

  List<FavouriteItemModel> _generateList(int length) {
    return List.generate(
      length,
      (index) => FavouriteItemModel(id: index.toString(), value: "Item $index"),
    );
  }
}
