part of 'gym_bloc.dart';

sealed class GymEvent extends Equatable {
  const GymEvent();

  @override
  List<Object> get props => [];
}

final class GymStarted extends GymEvent {}
