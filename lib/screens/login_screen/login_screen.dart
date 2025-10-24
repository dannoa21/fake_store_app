part of 'index.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: SvgIcon(
              iconName: "back",
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  t.welcomeBack,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                kVerticalSpace32,
                CustomTextFormField(
                  onChanged: (value) {},
                  hintText: t.enterUsernameHint,
                ),
                kVerticalSpace16,
                CustomTextFormField(
                  onChanged: (value) {},
                  hintText: t.enterPasswordHint,
                  obscureAllowed: true,
                ),
                kVerticalSpace32,
                CustomButton(
                  buttonText: t.login,
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      RouteNames.homeScreen,
                    );
                  },
                ),
                Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
