import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:predict_score_app/Scaffolds/TabsScaffold.dart';
import 'package:predict_score_app/Screens/AuthScreens/AuthScreen.dart';
import 'package:predict_score_app/Screens/AuthScreens/SignInScreen.dart';
import 'package:predict_score_app/Screens/AuthScreens/SignUpScreen.dart';
import 'package:predict_score_app/Screens/Notifications.dart';
import 'package:predict_score_app/Screens/ProfileScreens/AppSettings.dart';
import 'package:predict_score_app/Screens/ProfileScreens/EditProfile.dart';
import 'package:provider/provider.dart';

import 'Constants/colors.dart';
import 'Providers/MainProvider.dart';
import 'Screens/AuthScreens/ChangePasswordScreen.dart';
import 'Screens/AuthScreens/ForgotPasswordScreen.dart';
import 'Screens/AuthScreens/PhoneAuth.dart';
import 'firebase_options.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: kTransparent,
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainProvider()),
      ],
      child: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) return Container(color: Colors.amber);

          if (snapshot.connectionState == ConnectionState.done) {
            ///Removing splash screen
            FlutterNativeSplash.remove();

            return MaterialApp(
              theme: ThemeData(primaryColor: kDarkBlue),
              builder: (context, child) {
                return ScrollConfiguration(
                    behavior: MyBehavior(), child: child ?? Container());
              },
              routes: {
                TabsScaffold.id: (context) => TabsScaffold(),

                ///Auth Screens
                AuthScreen.id: (context) => AuthScreen(),
                SignUpScreen.id: (context) => SignUpScreen(),
                SignInScreen.id: (context) => SignInScreen(),
                ForgotPassword.id: (context) => ForgotPassword(),
                ChangePassword.id: (context) => ChangePassword(),
                PhoneAuth.id: (context) => PhoneAuth(),

                ///Profile Screens
                EditProfile.id: (context) => EditProfile(),
                AppSettings.id: (context) => AppSettings(),

                ///Notifications
                NotificationsScreen.id: (context) => NotificationsScreen(),
              },
              title: 'Score Predictor',
              initialRoute: AuthScreen.id,
              navigatorObservers: <NavigatorObserver>[observer],
            );
          }
          return Container(color: kBlack);
        },
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
