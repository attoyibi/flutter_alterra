import 'package:alterra_chat/views/chat_room_screen.dart';
import 'package:alterra_chat/views/sign_in_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'res/res.dart';
import 'view_model/view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => UserDao(),
        ),
      ],
      child: MaterialApp(
        builder: (context, child) => ResponsiveWrapper.builder(
          child,
          defaultScale: true,
        ),
        title: 'Alterra Chat',
        theme: theme,
        // 1
        home: Consumer<UserDao>(
          // 2
          builder: (context, userDao, child) {
            // 3
            if (userDao.isLoggedIn()) {
              return const ChatRoomScreen();
            } else {
              return const SignInScreen();
            }
          },
        ),
      ),
    );
  }
}
