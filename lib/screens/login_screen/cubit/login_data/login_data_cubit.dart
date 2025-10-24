import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_data_state.dart';

class LoginDataCubit extends Cubit<LoginDataState> {
  LoginDataCubit() : super(LoginDataState.initial());

  void updateUsername(String username) {
    emit(state.copyWith(username: username));
  }

  void updatePassword(String password) {
    emit(state.copyWith(password: password));
  }
}
