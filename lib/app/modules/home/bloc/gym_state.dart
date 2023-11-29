part of 'gym_bloc.dart';

sealed class GymState extends Equatable {
  const GymState();

  @override
  List<Object> get props => [];
}

final class GymInitial extends GymState {}

final class GymLoading extends GymState {}

final class GymSuccess extends GymState {
  final List<GymModel> gyms;

  const GymSuccess({required this.gyms});
  @override
  List<Object> get props => [gyms];
}

final class GymFailure extends GymState {
  final String message;

  const GymFailure({required this.message});
  @override
  List<Object> get props => [message];
}
