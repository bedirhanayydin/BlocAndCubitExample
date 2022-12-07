import 'package:bloc_sample_project/data/repository/cats_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cats_state.dart';

class CatsCubit extends Cubit<CatsState> {
  final CatsRepository catsRepository;
  CatsCubit(this.catsRepository) : super(const CatsInitial());

  Future<void> getCats() async {
    try {
      emit(const CatsLoading());
      Future.delayed(const Duration(milliseconds: 440));
      final response = await catsRepository.getCats();
      emit(CatsCompleted(response));
    } on NetworkError catch (e) {
      emit(CatsError(e.message));
    }
  }
}
