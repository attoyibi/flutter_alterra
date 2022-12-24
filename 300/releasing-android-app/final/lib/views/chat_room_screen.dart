import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../data/models/message.dart';
import '../res/res.dart';
import '../view_model/providers/message_dao.dart';
import '../view_model/view_model.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({super.key});

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _messageController = TextEditingController();
  String? email;
  @override
  Widget build(BuildContext context) {
    final messageDao = Provider.of<MessageDao>(context, listen: false);

    final userDao = Provider.of<UserDao>(context, listen: false);
    email = userDao.email();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: ChatRoomAppBar(
          email: email ?? 'No name',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: messageDao.getMessageStream(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return _buildList(context, snapshot.data!.docs);
              },
            ),
          ),
          ChatRoomMessageInput(
            messageController: _messageController,
            onSubmitted: (input) {
              _sendMessage(messageDao);
            },
            onTap: () {
              _sendMessage(messageDao);
            },
          )
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot>? snapshot) {
    return ListView(
      reverse: true,
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(left: 20, right: 20),
      children: snapshot!
          .map(
            (data) => _buildListItem(context, data),
          )
          .toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot snapshot) {
    final message = Message.fromSnapshot(snapshot);
    if (message.email == email) {
      return MyMessageWidget(
        time: DateFormat.Hm().format(message.date),
        text: message.text,
        email: message.email!,
      );
    } else {
      return SenderMessageWidget(
          time: DateFormat.Hm().format(message.date),
          text: message.text,
          email: message.email!);
    }
  }

  void _sendMessage(MessageDao messageDao) {
    if (_canSendMessage()) {
      final message = Message(
        text: _messageController.text,
        date: DateTime.now(),
        email: email,
      );
      messageDao.saveMessage(message);
      _messageController.clear();
      setState(() {});
    }
  }

  bool _canSendMessage() => _messageController.text.isNotEmpty;

  @override
  void dispose() {
    _scrollController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
