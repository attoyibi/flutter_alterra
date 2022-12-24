import 'package:alterra_chat/views/chat_room_screen.dart';
import 'package:alterra_chat/views/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/res.dart';
import '../view_model/view_model.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userDao = Provider.of<UserDao>(context, listen: false);
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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: AppColors.orangeColor,
                    textCapitalization: TextCapitalization.none,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      hintText: 'Email Address',
                    ),
                    controller: _emailController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Email Required';
                      }
                      return null;
                    },
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
                    // 1
                    controller: _passwordController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Password Required';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const Gaps(h: 40),
            FilledButton(
              onTap: () async {
                final navigator = Navigator.of(context);
                final errorMessage = await userDao.signIn(
                  _emailController.text,
                  _passwordController.text,
                );
                if (errorMessage != null) {
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(errorMessage),
                      duration: const Duration(milliseconds: 700),
                    ),
                  );
                } else {
                  navigator.pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const ChatRoomScreen(),
                    ),
                  );
                }
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
