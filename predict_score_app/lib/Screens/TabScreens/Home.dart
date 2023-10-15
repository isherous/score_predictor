import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:predict_score_app/Constants/colors.dart';
import 'package:predict_score_app/Constants/styles.dart';

import '../../Widgets/SingleMatchWidget.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final matchesKey = GlobalKey();
  final predictionsKey = GlobalKey();

  int topBarIndex = 0;
  double matchesWidth = 0;
  double predictionsWidth = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializingTheBorderWidths();
  }

  _initializingTheBorderWidths() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      RenderBox matchesBox =
          matchesKey.currentContext?.findRenderObject() as RenderBox;
      matchesWidth = matchesBox.size.width;

      RenderBox predictionsBox =
          predictionsKey.currentContext?.findRenderObject() as RenderBox;
      predictionsWidth = predictionsBox.size.width;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    key: matchesKey,
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      setState(() {
                        topBarIndex = 0;
                      });
                    },
                    child: AnimatedOpacity(
                      curve: Curves.easeInOut,
                      opacity: topBarIndex == 0 ? 1 : 0.5,
                      duration: const Duration(milliseconds: 300),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          "Matches",
                          style: k17Medium,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 20),

                  ///Predictions
                  GestureDetector(
                    key: predictionsKey,
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      setState(() {
                        topBarIndex = 1;
                      });
                    },
                    child: AnimatedOpacity(
                      curve: Curves.easeInOut,
                      opacity: topBarIndex == 1 ? 1 : 0.5,
                      duration: const Duration(milliseconds: 300),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text("Predictions", style: k17Medium),
                      ),
                    ),
                  ),
                ],
              ),

              ///Border
              AnimatedPositioned(
                left: topBarIndex == 0 ? 0 : matchesWidth + 20,
                top: 32,
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 300),
                child: AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 300),
                  height: 3,
                  color: kDarkBlue,
                  // width: 50,
                  width: topBarIndex == 0 ? matchesWidth : predictionsWidth,
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
