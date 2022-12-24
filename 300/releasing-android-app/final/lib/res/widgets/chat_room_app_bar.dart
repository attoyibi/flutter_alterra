import 'package:flutter/material.dart';

import '../../views/views.dart';
import '../res.dart';

class ChatRoomAppBar extends StatelessWidget {
  const ChatRoomAppBar({
    Key? key,
    required this.email,
  }) : super(key: key);
  final String email;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: ListTile(
        dense: false,
        leading: CircleAvatar(
          backgroundColor: AppColors.blackColor.withOpacity(0.4),
          radius: 35,
          backgroundImage: const AssetImage(
            AppStrings.avatarIcon,
          ),
        ),
        title: Text(email),
        subtitle: const Text('online'),
      ),
      actions: [
        IconAppBar(
          assetString: AppStrings.dotMenuIcon,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingScreen(),
              ),
            );
          },
        ),
        const Gaps(w: 15),
      ],
    );
  }
}
