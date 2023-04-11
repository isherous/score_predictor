import 'package:flutter/material.dart';
import 'package:predict_score_app/Constants/colors.dart';
import 'package:predict_score_app/Constants/styles.dart';
import 'package:predict_score_app/Providers/MainProvider.dart';
import 'package:provider/provider.dart';

import '../../Widgets/SingleMatchWidget.dart';
import 'package:intl/intl.dart' show DateFormat;

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider = Provider.of<MainProvider>(context);

    MainProvider mainProviderFalse =
        Provider.of<MainProvider>(context, listen: false);

    int topBarIndex = mainProvider.topBarIndex;

    final today = DateTime.now();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView(
        children: [
          const SizedBox(height: 8),

          ///Matches and Predictions (Top Bar)
          Stack(
            clipBehavior: Clip.none,
            children: [
              ///Tabs
              Row(
                children: [
                  ///Matches
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      mainProviderFalse.changeTopBarIndex(0);
                    },
                    child: AnimatedOpacity(
                      curve: Curves.easeInOut,
                      opacity: topBarIndex == 0 ? 1 : 0.5,
                      duration: const Duration(milliseconds: 300),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text("Matches", style: k13Medium),
                      ),
                    ),
                  ),

                  const SizedBox(width: 20),

                  ///Predictions
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      mainProviderFalse.changeTopBarIndex(1);
                    },
                    child: AnimatedOpacity(
                      curve: Curves.easeInOut,
                      opacity: topBarIndex == 1 ? 1 : 0.5,
                      duration: const Duration(milliseconds: 300),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text("Predictions", style: k13Medium),
                      ),
                    ),
                  ),
                ],
              ),

              ///Border
              AnimatedPositioned(
                left: topBarIndex == 0 ? 0 : 72,
                top: 28,
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 300),
                child: AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 300),
                  height: 3,
                  color: kDarkBlue,
                  // width: 50,
                  width: topBarIndex == 0 ? 50 : 60,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          ///Date
          Text(
            DateFormat('EE, dd MMM').format(today),
            style: k15Medium.copyWith(
              color: kWhite.withOpacity(0.5),
            ),
          ),

          const SizedBox(height: 16),

          ///Upcoming Matches/Predictions
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return SingleMatchWidget(
                showScores: topBarIndex == 1,
              );
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
