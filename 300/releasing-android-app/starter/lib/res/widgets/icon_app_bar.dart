import 'package:flutter/material.dart';

import '../res.dart';

class IconAppBar extends StatelessWidget {
  const IconAppBar({
    Key? key,
    required this.assetString,
    this.onTap,
  }) : super(key: key);

  final String assetString;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image(
        image: AssetImage(assetString),
        width: 35,
        color: AppColors.blackColor,
      ),
    );
  }
}
