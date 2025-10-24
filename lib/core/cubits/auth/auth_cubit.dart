import 'package:bloc/bloc.dart';
import 'package:fake_store_app/core/mocks/mock_user.dart';
import 'package:fake_store_app/core/repositories/auth_repository.dart';
import 'package:fake_store_app/models/index.dart';
import 'package:fake_store_app/utils/constants/index.dart';
import 'package:fake_store_app/utils/services/shared_prefs/index.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository,
       super(AuthInitial());

  Future<void> checkUserIsAuthenticated() async {
    try {
      SharedPreferencesService sharedPreferencesService =
          SharedPreferencesService();
      final token = sharedPreferencesService.getString(
        SharedPreferencesKeys.authToken,
      );
      await Future.delayed(const Duration(seconds: 2)); //simulate splash delay
      if (token == null || token.isEmpty) {
        emit(UserNotAuthenticatedState());
        return;
      }
      emit(UserAuthenticatedState(user: mockUser));
      //save token again to refresh expiry time (ideally should be done on each api call, right now doing from shared preference since dummy api)
      sharedPreferencesService.setString(
        SharedPreferencesKeys.authToken,
        token,
      );
      return;
    } catch (e) {
      emit(UserNotAuthenticatedState(message: e.toString()));
    }
    emit(UserNotAuthenticatedState());
  }

  Future<void> logOutUser() async {
    try {
      SharedPreferencesService sharedPreferencesService =
          SharedPreferencesService();
      await sharedPreferencesService.remove(
        SharedPreferencesKeys.authToken,
      );
      emit(UserNotAuthenticatedState());
    } catch (e) {
      emit(UserAuthenticatedState(user: mockUser));
    }
  }
}
