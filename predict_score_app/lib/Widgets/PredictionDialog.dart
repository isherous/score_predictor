import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import '../Constants/styles.dart';
import 'BlueButton.dart';

class PredictionSheet extends StatefulWidget {
  const PredictionSheet({Key? key}) : super(key: key);

  @override
  State<PredictionSheet> createState() => _PredictionSheetState();
}

class _PredictionSheetState extends State<PredictionSheet> {
  final _firstController = FixedExtentScrollController(initialItem: 3);
  final _secondController = FixedExtentScrollController(initialItem: 1);

  int _firstScore = 3;
  int _secondScore = 1;

  scorePicker(FixedExtentScrollController scrollController) async {
    await showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Container(
          height: 180,
          color: kWhite,
          child: CupertinoPicker(
            scrollController: scrollController,
            magnification: 1.22,
            squeeze: 1.2,
            useMagnifier: true,
            itemExtent: 36,
            onSelectedItemChanged: (int selectedNumber) {
              if (scrollController == _firstController) {
                _firstScore = scrollController.selectedItem;
              } else if (scrollController == _secondController) {
                _secondScore = scrollController.selectedItem;
              }
              setState(() {});
            },
            children: List.generate(
              11,
              (index) => Center(
                child: Text(
                  "${index}",
                  style: k13Medium.copyWith(color: kBlack),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390,
      padding: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: kLightBlack,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          SizedBox(height: 24),

          ///Your Prediction
          Text("Your Prediction", style: k15Medium),

          SizedBox(height: 24),

          ///Both Teams
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///First Team
              Column(
                children: [
                  ///Flag
                  Flag.fromCode(
                    FlagsCode.ES,
                    width: 60,
                    height: 60,
                    borderRadius: 30,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 12),

                  ///Half Name
                  Text("SPA", style: k15Medium)
                ],
              ),

              SizedBox(width: 38),

              ///VS
              Text(
                "vs",
                style: k15Medium.copyWith(
                  color: kWhite.withOpacity(0.5),
                ),
              ),

              SizedBox(width: 38),

              ///Second Team
              Column(
                children: [
                  ///Flag
                  Flag.fromCode(
                    FlagsCode.IT,
                    width: 60,
                    height: 60,
                    borderRadius: 30,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 12),

                  ///Half Name
                  Text("ITA", style: k15Medium)
                ],
              ),
            ],
          ),
          SizedBox(height: 42),

          ///Scores
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///First Score
              InkWell(
                onTap: () async {
                  scorePicker(_firstController);
                },
                child: Container(
                  width: 60,
                  height: 66,
                  decoration: BoxDecoration(
                    color: kWhite.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text("${_firstScore}", style: k30Bold),
                  ),
                ),
              ),

              SizedBox(width: 88),

              ///Second Score
              InkWell(
                onTap: () async {
                  scorePicker(_secondController);
                },
                child: Container(
                  width: 60,
                  height: 66,
                  decoration: BoxDecoration(
                    color: kWhite.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(child: Text("${_secondScore}", style: k30Bold)),
                ),
              ),
            ],
          ),

          SizedBox(height: 32),

          ///Confirm Button
          BlueButton(
            text: "Confirm",
            function: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
