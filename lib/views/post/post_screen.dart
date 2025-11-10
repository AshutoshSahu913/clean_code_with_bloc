import 'package:clean_code_with_bloc/bloc/post_bloc/post_bloc.dart';
import 'package:clean_code_with_bloc/bloc/post_bloc/post_event.dart';
import 'package:clean_code_with_bloc/bloc/post_bloc/post_state.dart';
import 'package:clean_code_with_bloc/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostBloc>().add(FetchPost());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostBloc, PostStates>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.success:
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      onChanged: (searchQuery) {
                        context.read<PostBloc>().add(FilterEvent(searchQuery));
                      },
                      decoration: InputDecoration(
                        hintText: "Search here....",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  Expanded(
                    child: state.searchMessage.isNotEmpty
                        ? Center(child: Text(state.searchMessage.toString()))
                        : ListView.builder(
                            itemCount: state.tempList.isEmpty
                                ? state.postList.length
                                : state.tempList.length,
                            itemBuilder: (context, index) {
                              final item = state.postList[index];
                              return ListTile(
                                title: Text(item.name.toString()),
                                subtitle: Text(item.body.toString()),
                              );
                            },
                          ),
                  ),
                ],
              );

            case PostStatus.loading:
              return Center(child: CircularProgressIndicator());
            case PostStatus.failure:
              return Center(child: Text(state.message.toString()));
          }
        },
      ),
    );
  }
}
