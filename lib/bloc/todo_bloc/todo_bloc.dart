import 'package:bloc/bloc.dart';
import 'package:clean_code_with_bloc/bloc/todo_bloc/todo_event.dart';
import 'package:clean_code_with_bloc/bloc/todo_bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvents, TodoState> {
  final List<String> todosList = [];

  TodoBloc() : super(const TodoState()) {
    on<AddTaskEvent>(_addTodoEvents);
    on<RemoveTaskEvent>(_removeTodoEvents);
  }

  void _addTodoEvents(AddTaskEvent event, Emitter<TodoState> emit) {
    todosList.add(event.task);
    emit(state.copyWith(todosList: List.from(todosList)));
  }

  void _removeTodoEvents(RemoveTaskEvent event, Emitter<TodoState> emit) {
    todosList.remove(event.task);
    emit(state.copyWith(todosList: List.from(todosList)));
  }
}
