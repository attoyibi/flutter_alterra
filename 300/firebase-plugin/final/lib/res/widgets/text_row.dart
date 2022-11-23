import 'package:flutter/material.dart';

import '../res.dart';

class TextRow extends StatelessWidget {
  const TextRow({
    Key? key,
    required this.textRow1,
    required this.textRow2,
    this.onTap,
  }) : super(key: key);

  final String textRow1;
  final String textRow2;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textRow1,
          style: Theme.of(context).textTheme.caption,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            textRow2,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: AppColors.orangeColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}
