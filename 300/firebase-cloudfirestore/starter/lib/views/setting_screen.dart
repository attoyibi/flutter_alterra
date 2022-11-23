import 'package:flutter/material.dart';

import '../res/res.dart';
import 'views.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.blackColor,
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignInScreen(),
                ),
                (route) => false);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.logout_rounded,
                size: 35,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                AppStrings.signOut,
                style: Theme.of(context).textTheme.bodyText1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
