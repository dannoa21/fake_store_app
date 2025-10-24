import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_store_app/utils/constants/index.dart';
import 'package:fake_store_app/utils/services/shared_prefs/index.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  Future<void> logout() async {
    try {
      SharedPreferencesService sharedPreferencesService =
          SharedPreferencesService();
      await sharedPreferencesService.remove(
        SharedPreferencesKeys.authToken,
      );
      emit(LogoutSuccessState());
    } catch (e) {
      emit(LogoutErrorState());
    }
  }
}
