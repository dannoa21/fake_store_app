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
                  onChanged: (value) {
                    context.read<LoginDataCubit>().updateUsername(value);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Invalid username";
                    }
                    return null;
                  },
                  hintText: t.enterUsernameHint,
                ),
                kVerticalSpace16,
                CustomTextFormField(
                  onChanged: (value) {
                    context.read<LoginDataCubit>().updatePassword(value);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password can't be empty";
                    }
                    if (value.length < 5) {
                      return "Password must be at least 5 characters"; // for demo
                    }
                    return null;
                  },
                  hintText: t.enterPasswordHint,
                  obscureAllowed: true,
                ),
                kVerticalSpace32,
                BlocListener<LoginCubit, LoginState>(
                  listener: (context, loginState) {
                    if (loginState is LoginSuccessState) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => HomeScreen()),
                        (Route<dynamic> route) =>
                            false, // remove all previous routes
                      );
                    } else if (loginState is LoginErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(loginState.message),
                        ),
                      );
                    }
                  },
                  child: BlocBuilder<LoginDataCubit, LoginDataState>(
                    builder: (context, loginDataState) {
                      return CustomButton(
                        buttonText: t.login,
                        isLoading:
                            context.watch<LoginCubit>().state
                                is LoginLoadingState,
                        onPressed: loginDataState.isValid
                            ? () {
                                final username = loginDataState.username;
                                final password = loginDataState.password;
                                context.read<LoginCubit>().login(
                                  username: username,
                                  password: password,
                                );
                              }
                            : null,
                      );
                    },
                  ),
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
