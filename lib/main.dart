import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:floatingbubble/firebase_options.dart';
import 'package:floatingbubble/ui/settings/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:floatingbubble/ui/chat_head.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  /// Initialize WidgetsBinding before runApp
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(builder: (
        context,
        themeProvider,
        child,
      ) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: themeProvider.applicationFont,
          ),
          home: const Scaffold(
            resizeToAvoidBottomInset: true,
            extendBody: true,
            extendBodyBehindAppBar: false,
            body: SafeArea(
              child: HomePage(),
            ),
          ),
        );
      }),
    );
  }
}
