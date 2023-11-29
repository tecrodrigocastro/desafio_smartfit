import 'package:desafio_smartfit/core/bloc/bloc/theme_bloc.dart';
import 'package:desafio_smartfit/core/utils/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final themeBloc = context.read<ThemeBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Image(
          height: 50,
          image: NetworkImage(
            'https://theme.zdassets.com/theme_assets/10123712/53d3035bf64ca3990890d9597362f6cf7bd75e18.png',
          ),
        ),
        centerTitle: true,
        toolbarHeight: 75,
        actions: [
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  setState(() {
                    isDark = !isDark;
                  });
                  themeBloc.add(ThemeChanged(isDark: isDark));
                },
                icon: Icon(state.isDark ? Icons.dark_mode : Icons.light_mode),
                iconSize: 50,
                color: theme.colorScheme
                    .copyWith(
                      primary: AppColors.yellow,
                    )
                    .primary,
              );
            },
          )
        ],
      ),
      body: Container(
        height: size.height,
        width: size.width,
        margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.2, vertical: size.height * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'reabertura'.toUpperCase(),
              style: theme.textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.bold,
                //color: AppColors.darkGrey,
              ),
            ),
            Text(
              'SmartFit'.toUpperCase(),
              style: theme.textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.bold,
                // color: AppColors.darkGrey,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 10,
              width: 100,
              color: Colors.black,
            ),
            const SizedBox(height: 20),
            Text(
              'O horário de funcionamento das nossas unidades está seguindo os decretos de cada município. Por isso, confira aqui se a sua unidade está aberta e as medidas de segurança que estamos seguindo.',
              style: theme.textTheme.titleLarge!.copyWith(
                  //color: AppColors.darkGrey,
                  ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: size.height * 0.4,
              width: size.width,
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 45,
                            color: theme.colorScheme
                                .copyWith(
                                  primary: AppColors.yellow,
                                )
                                .primary,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
