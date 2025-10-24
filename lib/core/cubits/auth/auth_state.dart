part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class UserAuthenticatedState extends AuthState {
  final User user;

  UserAuthenticatedState({required this.user});
}

final class UserNotAuthenticatedState extends AuthState {
  final String? message;

  UserNotAuthenticatedState({this.message});
}
