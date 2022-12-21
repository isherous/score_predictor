import 'package:flutter/material.dart';
import 'package:predict_score_app/Widgets/SingleMatchWidget.dart';

class PredictionsTab extends StatelessWidget {
  const PredictionsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 24),
        ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return SingleMatchWidget(showScores: true);
          },
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
