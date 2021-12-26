import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:whose_house_2/src/services/services.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthenticationService _authenticationService;
  LoginCubit(this._authenticationService) : super(const LoginState());

  void phoneChanged(String value) {
    final phone = Phone.dirty(value);
    emit(state.copyWith(
      phone: phone,
      status: Formz.validate([phone, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.phone, password]),
    ));
  }

  Future<void> loginWithPhoneAndPassword() async {
    if (state.status == FormzStatus.invalid) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    await Future.delayed(const Duration(seconds: 2));
    try {
      await _authenticationService.logIntWithPhoneAndPassword(
          state.phone.value, state.password.value);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
