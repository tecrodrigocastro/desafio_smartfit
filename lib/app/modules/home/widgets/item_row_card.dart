import 'package:desafio_smartfit/core/usecase/periodic_type.dart';
import 'package:flutter/material.dart';

class ItemRowCard extends StatefulWidget {
  const ItemRowCard({
    super.key,
    required this.title,
    required this.group,
    required this.value,
    required this.subtitle,
  });

  final String title;
  final String subtitle;
  final PeriodicType group;
  final PeriodicType value;

  @override
  State<ItemRowCard> createState() => _ItemRowCardState();
}

class _ItemRowCardState extends State<ItemRowCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: false,
          groupValue: widget.group,
          onChanged: (value) {},
        ),
        Text(widget.title),
        const Spacer(),
        Text(widget.subtitle)
      ],
    );
  }
}
