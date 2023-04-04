import 'package:flutter_bloc/flutter_bloc.dart';

import '../interfaces/interfaces.dart';
import './home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  final IHomeRepository _repository;
  HomeCubit(this._repository) : super(InitialState()) {
    _getListMovies();
  }

  Future<void> _getListMovies() async {
    emit(LoadingState());
    var result = await _repository.getListMovies();
    result.fold(
      (exception) => emit(ErrorState()),
      (movies) => emit(LoadedState(movies)),
    );
  }

}