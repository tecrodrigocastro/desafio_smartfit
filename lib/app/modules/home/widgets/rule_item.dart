import 'package:desafio_smartfit/core/utils/constants.dart';
import 'package:flutter/material.dart';

class RuleItemWidget extends StatefulWidget {
  const RuleItemWidget({
    super.key,
    required this.title,
    required this.legend1,
    required this.legend2,
    this.legend3,
    required this.image1,
    required this.image2,
  });
  final String title;
  final String legend1, legend2;
  final String? legend3;
  final String image1, image2;

  @override
  State<RuleItemWidget> createState() => _RuleItemWidgetState();
}

class _RuleItemWidgetState extends State<RuleItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          widget.title,
          style: Constants.theme(context).textTheme.titleLarge,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  widget.image1,
                  height: 80,
                ),
                Text(widget.legend1)
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Image.asset(
                  widget.image2,
                  height: 80,
                ),
                Text(widget.legend2)
              ],
            ),
          ],
        )
      ],
    );
  }
}
