import 'package:flutter/material.dart';

class Gaps extends StatelessWidget {
  const Gaps({
    super.key,
    this.h = 0.0,
    this.w = 0.0,
  });

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      width: w,
    );
  }
}
