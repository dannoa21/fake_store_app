part of 'login_data_cubit.dart';

@immutable
class LoginDataState {
  final String username;
  final String password;

  const LoginDataState({
    required this.username,
    required this.password,
  });

  factory LoginDataState.initial() => const LoginDataState(
    username: '',
    password: '',
  );

  LoginDataState copyWith({
    String? username,
    String? password,
  }) {
    return LoginDataState(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  bool get isValid => username.isNotEmpty && password.length >= 5;
}
