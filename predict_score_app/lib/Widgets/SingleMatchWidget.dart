import 'package:dotted_line/dotted_line.dart';
import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import '../Constants/styles.dart';

class SingleMatchWidget extends StatelessWidget {
  const SingleMatchWidget({Key? key, required this.showScores})
      : super(key: key);

  final bool showScores;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Time
                Column(
                  children: const [
                    Text("5:30", style: kSFMedium25),
                    SizedBox(height: 4),
                    Text("PM", style: kSFMedium13),
                    SizedBox(height: 8),
                    DottedLine(
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
                                    const Text("Spain", style: kSFMedium17),
                                  ],
                                ),
                                const SizedBox(height: 16),

                                ///VS
                                Text(
                                  "vs",
                                  style: kSFMedium17.copyWith(
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
                                    const Text("Italy", style: kSFMedium17),
                                  ],
                                ),
                              ],
                            ),

                            ///Scores
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  if (showScores)
                                    const Text("3", style: kSFMedium21),
                                  if (showScores)
                                    const Text("1", style: kSFMedium21)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(height: 1, color: kBorderBlack),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
