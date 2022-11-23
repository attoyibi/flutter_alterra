import 'package:flutter/material.dart';

import '../res.dart';

class ChatRoomMessageInput extends StatefulWidget {
  const ChatRoomMessageInput({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatRoomMessageInput> createState() => _ChatRoomMessageInputState();
}

class _ChatRoomMessageInputState extends State<ChatRoomMessageInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            color: AppColors.greyColor,
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              autofocus: false,
              maxLines: null,
              decoration: InputDecoration(
                fillColor: AppColors.greyColor,
                hintText: AppStrings.hintTextCR,
              ),
              cursorColor: AppColors.orangeColor,
            ),
          ),
          const Gaps(w: 10),
          Container(
            padding: const EdgeInsets.all(19),
            decoration: BoxDecoration(
              color: AppColors.orangeColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Image(
              image: AssetImage(AppStrings.sendIcon),
              width: 30,
              color: AppColors.orangeColor,
            ),
          ),
        ],
      ),
    );
  }
}
