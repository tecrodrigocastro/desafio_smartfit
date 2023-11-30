part of 'gym_bloc.dart';

sealed class GymEvent extends Equatable {
  const GymEvent();

  @override
  List<Object> get props => [];
}

final class GymStarted extends GymEvent {}

final class FilterGym extends GymEvent {
  const FilterGym(
    this.gyms, {
    required this.hour,
  });
  final String hour;
  final List<GymModel> gyms;
  @override
  List<Object> get props => [hour, gyms];
}
