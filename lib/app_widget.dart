import 'package:desafio_smartfit/app/modules/home/pages/home_page.dart';
import 'package:desafio_smartfit/core/bloc/bloc/theme_bloc.dart';
import 'package:desafio_smartfit/core/utils/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Desafio SmartFit',
            theme: ThemeData(
              //colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
              brightness: Brightness.light,
              textTheme: const TextTheme(
                displaySmall: TextStyle(
                  color: AppColors.darkGrey,
                ),
                titleLarge: TextStyle(
                  color: AppColors.darkGrey,
                ),
                headlineMedium: TextStyle(
                  color: AppColors.darkGrey,
                ),
                titleMedium: TextStyle(
                  color: AppColors.darkGrey,
                ),
              ),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              //colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
              brightness: Brightness.dark,
              useMaterial3: true,
            ),
            themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
