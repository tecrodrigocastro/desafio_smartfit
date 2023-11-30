import 'package:desafio_smartfit/app/modules/home/models/gym_model.dart';
import 'package:desafio_smartfit/core/utils/color_schema.dart';
import 'package:desafio_smartfit/core/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemCardList extends StatefulWidget {
  const ItemCardList({super.key, required this.gym});

  final GymModel gym;

  @override
  State<ItemCardList> createState() => _ItemCardListState();
}

class _ItemCardListState extends State<ItemCardList> {
  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.gym.opened! ? 'Aberto' : 'Fechado',
            style: Constants.theme(context).textTheme.titleMedium!.copyWith(
                  color: widget.gym.opened! ? AppColors.green : AppColors.red,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 20),
          Text(
            widget.gym.title!,
            style: Constants.theme(context).textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          // const SizedBox(height: 20),
          Text(
            widget.gym.content!,
            style: Constants.theme(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.lightGrey,
                ),
          ),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            children: [
              Image.asset(
                'assets/images/required-mask.png',
                height: 80,
              ),
              Image.asset(
                'assets/images/required-mask.png',
                height: 80,
              ),
              Image.asset(
                'assets/images/required-mask.png',
                height: 80,
              ),
              Image.asset(
                'assets/images/required-mask.png',
                height: 80,
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Seg. à Sex.',
                    style: Constants.theme(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '06h às 22h',
                    style: Constants.theme(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sáb.',
                    style: Constants.theme(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '09h às 18h',
                    style: Constants.theme(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Dom.',
            style: Constants.theme(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 5),
          Text(
            'Fechada',
            style: Constants.theme(context).textTheme.titleMedium!.copyWith(),
          ),
        ],
      ),
    );
  }
}
