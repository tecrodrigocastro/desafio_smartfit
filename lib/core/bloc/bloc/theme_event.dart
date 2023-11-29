part of 'theme_bloc.dart';


abstract class ThemeEvent extends Equatable {

  const ThemeEvent();


  @override

  List<Object> get props => [];

}


class ThemeChanged extends ThemeEvent {

  const ThemeChanged({required this.isDark});


  final bool isDark;


  @override

  List<Object> get props => [isDark];

}

