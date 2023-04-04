import 'package:equatable/equatable.dart';

import '../../models/models.dart';

abstract class HomeState extends Equatable {}

class InitialState extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadedState extends HomeState {

  final List<MovieModel> movies;
  LoadedState(this.movies);

  @override
  List<Object> get props => [];
}

class ErrorState extends HomeState {
  @override
  List<Object> get props => [];
}