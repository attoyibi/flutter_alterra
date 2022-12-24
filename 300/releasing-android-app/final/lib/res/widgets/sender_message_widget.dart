import 'package:flutter/material.dart';

import '../res.dart';

class SenderMessageWidget extends StatelessWidget {
  const SenderMessageWidget({
    super.key,
    required this.time,
    required this.text,
    required this.email,
  });

  final String time;
  final String text;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 45),
                child: Material(
                  color: AppColors.whiteColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Text(text,
                        style: Theme.of(context).textTheme.bodyText1),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(time),
                    Text(
                      email.substring(0, 4),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
