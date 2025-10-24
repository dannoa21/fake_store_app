part of 'index.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/login_background.jpg',
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(flex: 5),
                    SvgIcon(iconName: "app_logo"),
                    kVerticalSpace16,
                    Text(
                      t.appTitle,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    kVerticalSpace16,
                    CustomButton(
                      buttonText: t.login,
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          RouteNames.loginScreen,
                        );
                      },
                    ),
                    Spacer(flex: 2),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
