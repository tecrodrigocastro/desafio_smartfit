import 'package:desafio_smartfit/app/modules/home/bloc/gym_bloc.dart';
import 'package:desafio_smartfit/app/modules/home/widgets/item_card_list_widget.dart';
import 'package:desafio_smartfit/app/modules/home/widgets/item_row_card.dart';
import 'package:desafio_smartfit/app/modules/home/widgets/rule_item.dart';
import 'package:desafio_smartfit/core/bloc/bloc/theme_bloc.dart';
import 'package:desafio_smartfit/core/usecase/periodic_type.dart';
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
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final themeBloc = context.read<ThemeBloc>();
    final gymBloc = context.read<GymBloc>();
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
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
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
                  height: size.height * 0.5,
                  width: size.width,
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Qual periodo voce quer treinar?',
                            style: theme.textTheme.titleLarge!.copyWith(
                              fontSize: 25,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          const Divider(),
                          const ItemRowCard(
                            title: 'Manhã',
                            subtitle: 'Manhã 06:00 às 12:00',
                            group: PeriodicType.manha,
                            value: PeriodicType.manha,
                          ),
                          const Divider(),
                          const ItemRowCard(
                            title: 'Tarde',
                            subtitle: 'Tarde 12:01 às 18:00',
                            group: PeriodicType.manha,
                            value: PeriodicType.manha,
                          ),
                          const Divider(),
                          const ItemRowCard(
                            title: 'Noite',
                            subtitle: 'Noite 18:01 às 23:00',
                            group: PeriodicType.manha,
                            value: PeriodicType.manha,
                          ),
                          const Divider(),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                              const Text('Exibir unidades fechadas'),
                              const Spacer(),
                              Text.rich(
                                TextSpan(
                                  text: 'Resultados encontrados: ',
                                  style: theme.textTheme.titleLarge!.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w100,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '0',
                                      style:
                                          theme.textTheme.titleLarge!.copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(size.width * 0.17, 50),
                                  backgroundColor: theme.colorScheme
                                      .copyWith(
                                        primary: AppColors.yellow,
                                      )
                                      .primary,
                                  shape: const RoundedRectangleBorder(
                                      //borderRadius: BorderRadius.circular(10),
                                      ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'ENCONTRAR UNIDADE',
                                  style: theme.textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 50),
                              OutlinedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(size.width * 0.17, 50),
                                  shape: const RoundedRectangleBorder(
                                      //borderRadius: BorderRadius.circular(10),
                                      ),
                                ),
                                child: Text(
                                  'LIMPAR',
                                  style: theme.textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: size.height * 0.2,
                  width: size.width,
                  child: const Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RuleItemWidget(
                          title: 'Máscara',
                          legend1: 'Obrigatório',
                          legend2: 'Recomendado',
                          image1: 'assets/images/required-mask.png',
                          image2: 'assets/images/recommended-mask.png',
                        ),
                        RuleItemWidget(
                          title: 'Toalha',
                          legend1: 'Obrigatório',
                          legend2: 'Recomendado',
                          image1: 'assets/images/required-towel.png',
                          image2: 'assets/images/recommended-towel.png',
                        ),
                        RuleItemWidget(
                          title: 'Bebedouro',
                          legend1: 'Parcial',
                          legend2: 'Proibido',
                          image1: 'assets/images/partial-fountain.png',
                          image2: 'assets/images/forbidden-fountain.png',
                        ),
                        RuleItemWidget(
                          title: 'Vestiários',
                          legend1: 'Liberado',
                          legend2: 'Parcial',
                          image1: 'assets/images/required-lockerroom.png',
                          image2: 'assets/images/partial-lockerroom.png',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: size.height,
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 520,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemBuilder: (context, index) {
                      return const Card(
                        child: ItemCardList(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
