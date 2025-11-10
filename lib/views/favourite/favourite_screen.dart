import 'package:clean_code_with_bloc/bloc/favourite_bloc/favourite_app_bloc.dart';
import 'package:clean_code_with_bloc/bloc/favourite_bloc/favourite_app_state.dart';
import 'package:clean_code_with_bloc/config/color/colors.dart';
import 'package:clean_code_with_bloc/models/favourite_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/favourite_bloc/favourite_app_event.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteBloc>().add(FetchFavouriteEvent());
  }

  @override
  Widget build(BuildContext context) {
    IconData likeIcon = Icons.favorite_border_outlined;
    return Scaffold(
      appBar: AppBar(title: Text('Favourite App List')),
      body: BlocBuilder<FavouriteBloc, FavouriteItemModelState>(
        builder: (context, state) {
          switch (state.listStatus) {
            case null:
            case ListStatus.loading:
              return Center(
                child: CircularProgressIndicator(color: AppColors.appColor),
              );

            case ListStatus.success:
              return ListView.builder(
                itemCount: state.favItemList!.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = state.favItemList![index];
                  return ListTile(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Success"),
                            content: Text("Saved successfully"),
                            actions: [
                              TextButton(
                                child: Text("Approve"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    title: Text(item.value.toString()),
                    textColor: AppColors.blackColor,
                    trailing: IconButton(
                      onPressed: () {
                        FavouriteItemModel favModel = FavouriteItemModel(
                          id: item.id,
                          value: item.value,
                          isFavourite: item.isFavourite ? false : true,
                        );
                        context.read<FavouriteBloc>().add(
                          FavouriteItem(item: favModel),
                        );
                      },
                      icon: Icon(
                        item.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: item.isFavourite ? Colors.red : Colors.redAccent,
                      ),
                    ),
                  );
                },
              );

            case ListStatus.failure:
              return Center(child: Text("No Data Found!"));
          }
        },
      ),
    );
  }
}
