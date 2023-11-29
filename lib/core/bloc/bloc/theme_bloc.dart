import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';


part 'theme_event.dart';

part 'theme_state.dart';


class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {

  ThemeBloc() : super(const ThemeState(isDark: false)) {

    on<ThemeChanged>((event, emit) {

      print(event.isDark.toString());


      emit(ThemeState(isDark: event.isDark));


      print(state.isDark.toString());

    });

  }

}

