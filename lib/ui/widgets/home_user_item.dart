
import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import '../../shared/theme.dart';

class HomeUserItem extends StatelessWidget {
  final UserModel user;

  const HomeUserItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 120,
      margin: const EdgeInsets.only(
        right: 17,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(
              bottom: 13,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image:
                    user.profilePicture == null || user.profilePicture!.isEmpty
                        ? const AssetImage(
                            'assets/img_profile.png',
                          )
                        : NetworkImage(user.profilePicture!) as ImageProvider,
              ),
            ),
          ),
          Text(
            '@${user.username}',
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
