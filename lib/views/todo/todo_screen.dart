import 'package:clean_code_with_bloc/bloc/todo_bloc/todo_bloc.dart';
import 'package:clean_code_with_bloc/bloc/todo_bloc/todo_event.dart';
import 'package:clean_code_with_bloc/bloc/todo_bloc/todo_state.dart';
import 'package:clean_code_with_bloc/config/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo App ")),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todosList.isEmpty) {
            return Center(child: Text('No data Found !'));
          } else if (state.todosList.isNotEmpty) {
            return ListView.builder(
              itemCount: state.todosList.length,
              itemBuilder: (context, index) => ListTile(
                title: Text("This is ${state.todosList[index]}"),
                trailing: IconButton(
                  color: Colors.red,
                  onPressed: (){
                    context.read<TodoBloc>().add(RemoveTaskEvent(task:state.todosList[index]));
                  },
                  icon: Icon(Icons.delete, color: AppColors.redColor),
                ),
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 5; i++) {
            context.read<TodoBloc>().add(AddTaskEvent(task: "Task$i"));
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
