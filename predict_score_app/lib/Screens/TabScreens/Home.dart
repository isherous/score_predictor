import 'package:flutter/material.dart';

import '../../Widgets/SingleMatchWidget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 24),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return SingleMatchWidget(showScores: false);
          },
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
