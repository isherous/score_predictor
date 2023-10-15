import 'package:flutter/material.dart';
import 'package:predict_score_app/Constants/colors.dart';
import 'package:predict_score_app/Constants/styles.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ListView(
        children: [
          const SizedBox(height: 24),

          ///Rank, Name, Accuracy and Points
          Row(
            children: [
              ///Rank
              Expanded(
                flex: 2,
                child: Text(
                  "Rank",
                  style: k13Medium.copyWith(
                    color: kWhite.withOpacity(0.5),
                  ),
                ),
              ),

              ///Name
              Expanded(
                flex: 7,
                child: Text(
                  "Name",
                  style: k13Medium.copyWith(
                    color: kWhite.withOpacity(0.5),
                  ),
                ),
              ),

              ///Accuracy
              Expanded(
                flex: 2,
                child: Text(
                  "Acc.",
                  style: k13Medium.copyWith(
                    color: kWhite.withOpacity(0.5),
                  ),
                ),
              ),

              ///Points
              Expanded(
                flex: 3,
                child: Text(
                  "Points",
                  style: k13Medium.copyWith(
                    color: kWhite.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          ///Ranks
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return SingleRank(index: index);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 12);
            },
          ),

          const SizedBox(height: 48),
        ],
      ),
    );
  }
}

class SingleRank extends StatelessWidget {
  const SingleRank({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: kWhite.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ///Rank
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                "${index + 1}",
                style: k15Medium.copyWith(
                  color: kWhite.withOpacity(0.5),
                ),
              ),
            ),
          ),

          ///Name
          Expanded(
            flex: 7,
            child: Text(
              "John Doe",
              style: k15Medium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          ///Accuracy
          Expanded(
            flex: 2,
            child: Text(
              "88%",
              style: k13Medium,
              maxLines: 1,
            ),
          ),

          ///Points
          Expanded(
            flex: 3,
            child: Text(
              "7000 pts",
              style: k13Medium,
            ),
          ),
        ],
      ),
    );
  }
}
