import 'package:flutter/material.dart';
import 'package:predict_score_app/Constants/colors.dart';
import 'package:predict_score_app/Constants/styles.dart';
import 'package:predict_score_app/Providers/MainProvider.dart';
import 'package:predict_score_app/Screens/TabScreens/Home.dart';
import 'package:predict_score_app/Screens/TabScreens/Predictions.dart';
import 'package:predict_score_app/Screens/TabScreens/Profile.dart';
import 'package:provider/provider.dart';

class TabsScaffold extends StatelessWidget {
  TabsScaffold({Key? key}) : super(key: key);

  static const id = "tabs_scaffold";

  final _names = ["Upcoming Games", "Predictions", "Profile"];

  final _tabs = [
    HomeTab(),
    PredictionsTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    MainProvider mainProvider = Provider.of<MainProvider>(context);
    MainProvider mainProviderFalse =
        Provider.of<MainProvider>(context, listen: false);

    int bottomBarIndex = mainProvider.bottomBarIndex;

    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
        elevation: 2,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: Container(
            color: kBorderBlack,
            height: 1.0,
          ),
        ),
        title: Text(_names[bottomBarIndex], style: kSFMedium16),
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 82,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: kLightBlack,
            ),
          ),

          ///Home
          AnimatedPositioned(
            top: bottomBarIndex == 0 ? -26 : 6,
            left: width * .25 - 26,
            right: width * .75 - 26,
            duration: const Duration(milliseconds: 200),
            child: GestureDetector(
              onTap: () {
                mainProviderFalse.changeBottomBarIndex(0);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: bottomBarIndex == 0 ? kDarkBlue : kTransparent,
                  border: Border.all(
                    width: 4,
                    color:
                        kTransparent.withOpacity(bottomBarIndex == 0 ? 1 : 0),
                  ),
                ),
                child: Icon(Icons.home, color: kWhite, size: 30),
              ),
            ),
          ),

          ///Predictions
          AnimatedPositioned(
            top: bottomBarIndex == 1 ? -26 : 6,
            left: width / 2 - 26,
            right: width / 2 - 26,
            duration: const Duration(milliseconds: 200),
            child: GestureDetector(
              onTap: () {
                mainProviderFalse.changeBottomBarIndex(1);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: bottomBarIndex == 1 ? kDarkBlue : kTransparent,
                  border: Border.all(
                    width: 4,
                    color:
                        kTransparent.withOpacity(bottomBarIndex == 1 ? 1 : 0),
                  ),
                ),
                child: Icon(Icons.monetization_on_outlined,
                    color: kWhite, size: 30),
              ),
            ),
          ),

          ///Profile
          AnimatedPositioned(
            top: bottomBarIndex == 2 ? -26 : 6,
            right: width * .25 - 26,
            left: width * .75 - 26,
            duration: const Duration(milliseconds: 200),
            child: GestureDetector(
              onTap: () {
                mainProviderFalse.changeBottomBarIndex(2);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: bottomBarIndex == 2 ? kDarkBlue : kTransparent,
                  border: Border.all(
                    width: 4,
                    color:
                        kTransparent.withOpacity(bottomBarIndex == 2 ? 1 : 0),
                  ),
                ),
                child: Icon(Icons.person, color: kWhite, size: 30),
              ),
            ),
          ),
        ],
      ),
      body: _tabs[bottomBarIndex],
    );
  }
}
