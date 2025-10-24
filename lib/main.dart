import 'package:fake_store_app/config/index.dart';
import 'package:fake_store_app/utils/services/shared_prefs/index.dart';
import 'package:fake_store_app/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Init prefs to avoid late initialization error
  await SharedPreferencesService().initPrefs();

  //lock the app in portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: DefaultThemeConfig.defaultTheme,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      // home: IntroScreen(),
    );
  }
}
