import 'package:alterra_chat/views/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'res/res.dart';

void main() {
  runApp(const AlterraChat());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
}

class AlterraChat extends StatelessWidget {
  const AlterraChat({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.light();
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        defaultScale: true,
      ),
      title: 'Alterra Chat',
      theme: theme,
      home: const SignInScreen(),
    );
  }
}
