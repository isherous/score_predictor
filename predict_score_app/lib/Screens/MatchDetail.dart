import 'package:flag/flag_widget.dart';
import 'package:flag/flag_enum.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:predict_score_app/Constants/colors.dart';
import 'package:predict_score_app/Constants/styles.dart';
import 'package:predict_score_app/Scaffolds/BackButtonScaffold.dart';
import 'package:predict_score_app/Widgets/BlueButton.dart';
import 'package:intl/intl.dart' show DateFormat;

class MatchDetailScreen extends StatelessWidget {
  const MatchDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final today = DateTime.now();

    return BackButtonScaffold(
      title: "SPA vs ITA",
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ///Match Details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Both Teams
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///First Team
                    Row(
                      children: [
                        ///Flag
                        Flag.fromCode(
                          FlagsCode.ES,
                          width: 60,
                          height: 60,
                          borderRadius: 30,
                          fit: BoxFit.fill,
                        ),

                        const SizedBox(width: 12),

                        ///Country Names
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ///Full Name
                            Text("Spain", style: k13Medium),

                            const SizedBox(height: 4),

                            ///Half Name
                            Text(
                              "SPA",
                              style: k13Medium.copyWith(
                                color: kWhite.withOpacity(0.5),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),

                    ///VS
                    Text(
                      'vs',
                      style: k15Medium.copyWith(color: kWhite.withOpacity(0.5)),
                    ),

                    ///Second Team
                    Row(
                      children: [
                        ///Flag
                        Flag.fromCode(
                          FlagsCode.IT,
                          width: 60,
                          height: 60,
                          borderRadius: 30,
                          fit: BoxFit.fill,
                        ),

                        const SizedBox(width: 12),

                        ///Country Names
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ///Full Name
                            Text("Italy", style: k13Medium),

                            const SizedBox(height: 4),

                            ///Half Name
                            Text(
                              "ITA",
                              style: k13Medium.copyWith(
                                color: kWhite.withOpacity(0.5),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                ///Border
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 24),
                  height: 1,
                  color: kBorderBlack,
                ),

                ///Details
                Text(
                  "Details",
                  style: k15Medium.copyWith(
                    color: kWhite.withOpacity(0.5),
                  ),
                ),

                const SizedBox(height: 16),

                ///Stadium
                Text(
                  "Name of the stadium",
                  style: k15Medium,
                ),
                const SizedBox(height: 16),

                ///Date and Time
                Row(
                  children: [
                    ///Date
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(FontAwesomeIcons.calendar,color: kWhite,size: 12,),
                          const SizedBox(width: 8),
                          Text(DateFormat('EE, dd MMM').format(today), style: k13Medium),
                        ],
                      ),
                    ),

                    ///Time
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(FontAwesomeIcons.clock,color: kWhite,size: 12,),
                          const SizedBox(width: 8),
                          Text(DateFormat('hh:mm a').format(today), style: k13Medium),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),

            ///Make Prediction Button
            BlueButton(text: "Make prediction", function: () {}),
          ],
        ),
      ),
    );
  }
}
