import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:whose_house_2/src/app/app.dart';
import 'package:whose_house_2/src/services/authentication_service/authentication_service.dart';

void main(List<String> args) async {
  final AuthenticationService _authenticationService = AuthenticationService();
  await _authenticationService.user.first;
  BlocOverrides.runZoned(() {
    runApp(MyApp(
      authenticationService: _authenticationService,
    ));
  }, blocObserver: AppBlocObserver());
}
