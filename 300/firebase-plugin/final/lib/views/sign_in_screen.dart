import 'package:alterra_chat/views/chat_room_screen.dart';
import 'package:alterra_chat/views/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../res/res.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                image: AssetImage(
                  AppStrings.altaLogo,
                ),
              ),
            ),
            const Gaps(h: 40),
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
                const Gaps(h: 20),
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
            const Gaps(h: 40),
            FilledButton(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatRoomScreen(),
                    ),
                    (route) => false);
              },
              buttonType: 'Sign In',
            ),
            const Gaps(h: 40),
            TextRow(
              textRow1: AppStrings.loginTextRow1,
              textRow2: AppStrings.loginTextRow2,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
