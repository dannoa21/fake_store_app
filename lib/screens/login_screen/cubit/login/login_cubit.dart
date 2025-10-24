import 'package:bloc/bloc.dart';
import 'package:fake_store_app/core/repositories/auth_repository.dart';
import 'package:fake_store_app/utils/constants/index.dart';
import 'package:fake_store_app/utils/services/shared_prefs/index.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  LoginCubit({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository,
       super(LoginInitial());

  Future<void> login({
    required String username,
    required String password,
  }) async {
    try {
      emit(LoginLoadingState());
      final token = await _authRepository.authenticateUser(
        username: username,
        password: password,
      );

      SharedPreferencesService().setString(
        SharedPreferencesKeys.authToken,
        token,
      );

      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginErrorState(message: e.toString()));
    }
  }
}
