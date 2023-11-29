import 'package:bloc/bloc.dart';
import 'package:desafio_smartfit/app/modules/home/models/gym_model.dart';
import 'package:desafio_smartfit/app/modules/home/repositories/gym_repositoy.dart';
import 'package:equatable/equatable.dart';

part 'gym_event.dart';
part 'gym_state.dart';

class GymBloc extends Bloc<GymEvent, GymState> {
  final GymRepository _gymRepository;
  GymBloc({
    required GymRepository gymRepository,
  })  : _gymRepository = gymRepository,
        super(GymInitial()) {
    on<GymStarted>((event, emit) async {
      emit(GymLoading());
      final result = await _gymRepository.getGyms();
      emit(GymSuccess(gyms: result));
    });
  }
}
