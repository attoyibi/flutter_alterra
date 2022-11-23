import 'package:flutter/material.dart';

import '../res/res.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({super.key});

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: ChatRoomAppBar(
          email: 'No name',
        ),
      ),
      body: Column(
        children: const [
          Expanded(
            child: SizedBox(),
          ),
          ChatRoomMessageInput()
        ],
      ),
    );
  }
}
