part of 'index.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is UserAuthenticatedState) {
          Navigator.of(context).pushNamed(
            RouteNames.homeScreen,
          );
          FlutterNativeSplash.remove();
        } else if (state is UserNotAuthenticatedState) {
          Navigator.of(context).pushNamed(
            RouteNames.introScreen,
          );
          FlutterNativeSplash.remove();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: GestureDetector(
              onTap: () {
                context.read<AuthCubit>().checkUserIsAuthenticated();
              },
              child: Text(
                AppLocalizations.of(context)!.appTitle,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
