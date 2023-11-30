part of 'gym_bloc.dart';

sealed class GymState extends Equatable {
  const GymState(this.gyms);
  final List<GymModel> gyms;

  @override
  List<Object> get props => [gyms];
}

final class GymInitial extends GymState {
  const GymInitial(super.gyms);
}

final class GymLoading extends GymState {
  const GymLoading(super.gyms);
}

final class GymSuccess extends GymState {
  @override
  final List<GymModel> gymss;

  const GymSuccess(super.gyms, {required this.gymss});
  @override
  List<Object> get props => [gyms];
}

final class GymFailure extends GymState {
  final String message;

  const GymFailure(super.gyms, {required this.message});
  @override
  List<Object> get props => [message];
}
