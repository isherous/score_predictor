import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:predict_score_app/Constants/colors.dart';
import 'package:predict_score_app/Constants/styles.dart';
import 'package:predict_score_app/Constants/values.dart';
import 'package:predict_score_app/Screens/ProfileScreens/AppSettings.dart';
import 'package:predict_score_app/Screens/ProfileScreens/EditProfile.dart';

import '../../Widgets/SettingsWidget.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 32),

        ///Profile Picture
        Container(
          height: 104,
          width: 104,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kDarkBlue,
            border: Border.all(
              color: kBorderBlack.withOpacity(0.3),
              width: 4,
            ),
          ),
          child: Center(
            child: SvgPicture.asset(kProfileSVG, height: 24),
          ),
        ),

        const SizedBox(height: 12),

        ///Name
        Center(
          child: Text(
            "Miranda Kain",
            style: k21Medium,
          ),
        ),

        const SizedBox(height: 32),

        ///Edit profile
        SettingsWidget(
          text: "Edit Profile",
          onTap: () {
            Navigator.pushNamed(context, EditProfile.id);
          },
        ),

        ///App Settings
        SettingsWidget(
          text: "App Settings",
          onTap: () {
            Navigator.pushNamed(context, AppSettings.id);
          },
        ),

        ///Invite Friends
        SettingsWidget(
          text: "Invite Friends",
          onTap: () {},
        ),
      ],
    );
  }
}
