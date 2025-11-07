import 'package:equatable/equatable.dart';

abstract class TodoEvents extends Equatable {
  const TodoEvents();
}

class AddTaskEvent extends TodoEvents {
  final String task;

  const AddTaskEvent({required this.task});

  @override
  List<Object?> get props => [task];
}

class RemoveTaskEvent extends TodoEvents {
  final Object task;

  const RemoveTaskEvent({required this.task});

  @override
  List<Object?> get props => [task];
}
