import 'package:flutter/material.dart';
import 'package:predict_score_app/Constants/colors.dart';
import 'package:predict_score_app/Constants/styles.dart';
import 'package:predict_score_app/Scaffolds/BackButtonScaffold.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  static const id = "notifications_screen";

  @override
  Widget build(BuildContext context) {
    return BackButtonScaffold(
      title: "Notifications",
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                "This is a notification",
                style: k15Medium,
              ),
              trailing: Text(
                "12:23 PM",
                style: k13Medium.copyWith(
                  color: kWhite.withOpacity(0.5),
                ),
              ),
            );
          }),
    );
  }
}
