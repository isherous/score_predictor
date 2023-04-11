import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:predict_score_app/Scaffolds/TabsScaffold.dart';
import 'package:predict_score_app/Screens/AuthScreens/AuthScreen.dart';
import 'package:predict_score_app/Screens/AuthScreens/SignInScreen.dart';
import 'package:predict_score_app/Screens/AuthScreens/SignUpScreen.dart';
import 'package:predict_score_app/Screens/Notifications.dart';
import 'package:predict_score_app/Screens/ProfileScreens/AppSettings.dart';
import 'package:predict_score_app/Screens/ProfileScreens/EditProfile.dart';
import 'package:provider/provider.dart';
import 'Constants/colors.dart';
import 'Providers/AuthProvider.dart';
import 'Providers/MainProvider.dart';
import 'Screens/AuthScreens/ChangePasswordScreen.dart';
import 'Screens/AuthScreens/ForgotPasswordScreen.dart';
import 'Screens/AuthScreens/PhoneAuth.dart';
import 'firebase_options.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

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
        ChangeNotifierProvider(create: (_) => AuthProvider()),
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
              supportedLocales: [
                Locale("af"),
                Locale("am"),
                Locale("ar"),
                Locale("az"),
                Locale("be"),
                Locale("bg"),
                Locale("bn"),
                Locale("bs"),
                Locale("ca"),
                Locale("cs"),
                Locale("da"),
                Locale("de"),
                Locale("el"),
                Locale("en"),
                Locale("es"),
                Locale("et"),
                Locale("fa"),
                Locale("fi"),
                Locale("fr"),
                Locale("gl"),
                Locale("ha"),
                Locale("he"),
                Locale("hi"),
                Locale("hr"),
                Locale("hu"),
                Locale("hy"),
                Locale("id"),
                Locale("is"),
                Locale("it"),
                Locale("ja"),
                Locale("ka"),
                Locale("kk"),
                Locale("km"),
                Locale("ko"),
                Locale("ku"),
                Locale("ky"),
                Locale("lt"),
                Locale("lv"),
                Locale("mk"),
                Locale("ml"),
                Locale("mn"),
                Locale("ms"),
                Locale("nb"),
                Locale("nl"),
                Locale("nn"),
                Locale("no"),
                Locale("pl"),
                Locale("ps"),
                Locale("pt"),
                Locale("ro"),
                Locale("ru"),
                Locale("sd"),
                Locale("sk"),
                Locale("sl"),
                Locale("so"),
                Locale("sq"),
                Locale("sr"),
                Locale("sv"),
                Locale("ta"),
                Locale("tg"),
                Locale("th"),
                Locale("tk"),
                Locale("tr"),
                Locale("tt"),
                Locale("uk"),
                Locale("ug"),
                Locale("ur"),
                Locale("uz"),
                Locale("vi"),
                Locale("zh")
              ],
              // localizationsDelegates: [
              //   CountryLocalizations.delegate,
              // ],
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
