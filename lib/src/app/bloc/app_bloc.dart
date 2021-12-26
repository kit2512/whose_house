import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:whose_house_2/src/services/authentication_service/authentication_service.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthenticationService _authenticationService;
  late final StreamSubscription _userSubscription;
  AppBloc({required AuthenticationService authenticationService})
      : _authenticationService = authenticationService,
        super(
          authenticationService.currentUser.isEmpty
              ? const AppState.unauthenticated()
              : AppState.authenticated(user: authenticationService.currentUser),
        ) {
    on<LogOutRequested>(_logOut);
    on<AppUserChanged>(_appUserChanged);
    on<AppInitialize>(_appInitialize);

    _userSubscription = _authenticationService.user.listen((user) {
      add(AppUserChanged(user));
    });
  }

  FutureOr<void> _logOut(LogOutRequested event, Emitter<AppState> emit) async {
    unawaited(_authenticationService.logOut());
    emit(const AppState.initializing());
  }

  FutureOr<void> _appUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    emit(
      event.user.isEmpty
          ? const AppState.unauthenticated()
          : AppState.authenticated(user: event.user),
    );
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }

  FutureOr<void> _appInitialize(
      AppInitialize event, Emitter<AppState> emit) async {
    await Future.delayed(const Duration(seconds: 1));
    emit(
      _authenticationService.currentUser.isEmpty
          ? const AppState.unauthenticated()
          : AppState.authenticated(user: _authenticationService.currentUser),
    );
  }
}
