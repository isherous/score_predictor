import 'package:dotted_line/dotted_line.dart';
import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:predict_score_app/Screens/MatchDetail.dart';

import '../Constants/colors.dart';
import '../Constants/styles.dart';

class SingleMatchWidget extends StatelessWidget {
  const SingleMatchWidget({Key? key, required this.showScores})
      : super(key: key);

  final bool showScores;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MatchDetailScreen(),
          ),
        );
      },
      child: Column(
        children: [
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Time
              Column(
                children: [
                  Text("5:30", style: k25Medium),
                  const SizedBox(height: 4),
                  Text("PM", style: k13Medium),
                  const SizedBox(height: 8),
                  const DottedLine(
                    direction: Axis.vertical,
                    lineLength: 62,
                    lineThickness: 2,
                    dashLength: 2.0,
                    dashColor: kBorderBlack,
                  )
                ],
              ),

              const SizedBox(width: 18),

              ///Countries, Scores and Border
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///Countries and Scores
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///Countries
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ///First Country
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flag.fromCode(
                                    FlagsCode.ES,
                                    width: 30,
                                    height: 30,
                                    borderRadius: 16,
                                    fit: BoxFit.fill,
                                  ),
                                  const SizedBox(width: 12),
                                  Text("Spain", style: k17Medium),
                                ],
                              ),
                              const SizedBox(height: 16),

                              ///VS
                              Text(
                                "vs",
                                style: k17Medium.copyWith(
                                    color: kWhite.withOpacity(0.5)),
                              ),
                              const SizedBox(height: 16),

                              ///Second Country
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flag.fromCode(
                                    FlagsCode.IT,
                                    width: 30,
                                    height: 30,
                                    borderRadius: 16,
                                    fit: BoxFit.fill,
                                  ),
                                  const SizedBox(width: 12),
                                  Text("Italy", style: k17Medium),
                                ],
                              ),
                            ],
                          ),

                          ///Scores
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if (showScores) Text("3", style: k21Medium),
                                if (showScores) Text("1", style: k21Medium)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    ///Border
                    Container(height: 1, color: kBorderBlack),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
