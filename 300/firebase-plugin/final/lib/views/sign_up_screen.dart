import 'package:flutter/material.dart';

import '../res/res.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 30,
          ),
          children: [
            const Center(
              child: Image(
                image: AssetImage(AppStrings.altaLogo),
              ),
            ),
            const Gaps(
              h: 40,
            ),
            Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: AppColors.orangeColor,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    hintText: 'Email Address',
                  ),
                ),
                const Gaps(
                  h: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: AppColors.orangeColor,
                  obscureText: true,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
              ],
            ),
            const Gaps(
              h: 40,
            ),
            FilledButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonType: 'Sign Up',
            ),
            const Gaps(
              h: 40,
            ),
            TextRow(
              textRow1: AppStrings.signUpTextRow1,
              textRow2: AppStrings.signUpTextRow2,
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
