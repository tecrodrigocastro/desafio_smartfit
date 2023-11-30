import 'dart:async';

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
        super(const GymInitial([])) {
    on<GymStarted>((event, emit) async {
      emit(const GymLoading([]));
      final result = await _gymRepository.getGyms();
      Timer(const Duration(seconds: 5), () {});
      emit(GymSuccess(result, gymss: result));
    });

    on<FilterGym>((event, emit) async {
      emit(const GymLoading([]));
      List<GymModel> filteredGyms = event.gyms
          .where((e) =>
              e.schedules != null &&
              e.schedules!
                  .any((e) => e.hour != null && e.hour!.contains(event.hour)))
          .toList();
      emit(GymSuccess(filteredGyms, gymss: filteredGyms));
    });
  }
}
