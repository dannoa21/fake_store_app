part of 'logout_cubit.dart';

sealed class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object> get props => [];
}

final class LogoutInitial extends LogoutState {}

class LogoutSuccessState extends LogoutState {}

class LogoutErrorState extends LogoutState {}
