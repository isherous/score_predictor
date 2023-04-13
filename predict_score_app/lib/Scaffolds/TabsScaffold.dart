import 'package:flutter/material.dart';
import 'package:predict_score_app/Constants/colors.dart';
import 'package:predict_score_app/Constants/styles.dart';
import 'package:predict_score_app/Constants/values.dart';
import 'package:predict_score_app/Providers/MainProvider.dart';
import 'package:predict_score_app/Screens/Notifications.dart';
import 'package:predict_score_app/Screens/TabScreens/Home.dart';
import 'package:predict_score_app/Screens/TabScreens/LeaderBoard.dart';
import 'package:predict_score_app/Screens/TabScreens/Profile.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';

class TabsScaffold extends StatelessWidget {
  TabsScaffold({Key? key}) : super(key: key);

  static const id = "tabs_scaffold";

  final _names = ["Upcoming Games", "Leaderboard", "Profile"];

  final _tabs = const [
    HomeTab(),
    LeaderBoard(),
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
        title: Text(
          _names[bottomBarIndex],
          style: k16Medium,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, NotificationsScreen.id);
            },
            icon: const Icon(Icons.notifications_none),
          )
        ],
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          ///Bottom bar
          Container(
            height: 82,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: kLightBlack,
            ),
          ),

          ///Home
          AnimatedPositioned(
            top: bottomBarIndex == 0 ? -32 : 0,
            left: width * .25 - 32,
            right: width * .75 - 32,
            duration: const Duration(milliseconds: 200),
            child: GestureDetector(
              onTap: () {
                mainProviderFalse.changeBottomBarIndex(0);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: bottomBarIndex == 0 ? kDarkBlue : kTransparent,
                  border: Border.all(
                    width: 4,
                    color:
                        kTransparent.withOpacity(bottomBarIndex == 0 ? 1 : 0),
                  ),
                ),
                child: Center(child: SvgPicture.asset(kHomeSVG, height: 24)),
                // child: const Icon(Icons.home, color: kWhite, size: 26),
              ),
            ),
          ),

          ///LeaderBoard
          AnimatedPositioned(
            top: bottomBarIndex == 1 ? -32 : 0,
            left: width / 2 - 32,
            right: width / 2 - 32,
            duration: const Duration(milliseconds: 200),
            child: GestureDetector(
              onTap: () {
                mainProviderFalse.changeBottomBarIndex(1);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: bottomBarIndex == 1 ? kDarkBlue : kTransparent,
                  border: Border.all(
                    width: 4,
                    color:
                        kTransparent.withOpacity(bottomBarIndex == 1 ? 1 : 0),
                  ),
                ),
                child: Center(
                    child: SvgPicture.asset(kLeaderBoardSVG, height: 24)),
              ),
            ),
          ),

          ///Profile
          AnimatedPositioned(
            top: bottomBarIndex == 2 ? -32 : 0,
            right: width * .25 - 32,
            left: width * .75 - 32,
            duration: const Duration(milliseconds: 200),
            child: GestureDetector(
              onTap: () {
                mainProviderFalse.changeBottomBarIndex(2);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: bottomBarIndex == 2 ? kDarkBlue : kTransparent,
                  border: Border.all(
                    width: 4,
                    color:
                        kTransparent.withOpacity(bottomBarIndex == 2 ? 1 : 0),
                  ),
                ),
                child: Center(child: SvgPicture.asset(kProfileSVG, height: 24)),
              ),
            ),
          ),
        ],
      ),
      body: _tabs[bottomBarIndex],
    );
  }
}
