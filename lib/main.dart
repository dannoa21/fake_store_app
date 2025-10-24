import 'package:fake_store_app/config/index.dart';
import 'package:fake_store_app/core/cubits/auth/auth_cubit.dart';
import 'package:fake_store_app/core/repositories/auth_repository.dart';
import 'package:fake_store_app/utils/services/network/index.dart';
import 'package:fake_store_app/utils/services/shared_prefs/index.dart';
import 'package:fake_store_app/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Init prefs to avoid late initialization error
  await SharedPreferencesService().initPrefs();

  //lock the app in portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => NetworkImplService(
            SharedPreferencesService(),
          ),
        ),
        RepositoryProvider(
          create: (context) => AuthRepository(
            client: context.read<NetworkImplService>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(
              authRepository: context.read<AuthRepository>(),
            )..checkUserIsAuthenticated(),
          ),
        ],
        child: Builder(
          builder: (context) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: DefaultThemeConfig.defaultTheme,
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              onGenerateRoute: (settings) =>
                  RouteGenerator.generateRoute(settings),
            );
          },
        ),
      ),
    );
  }
}
