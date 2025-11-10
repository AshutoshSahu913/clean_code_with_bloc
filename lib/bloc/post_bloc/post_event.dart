import 'package:equatable/equatable.dart';

abstract class UserPostEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchPost extends UserPostEvent {}

class FilterEvent extends UserPostEvent {
  final String searchQuery;

  FilterEvent(this.searchQuery);
}
