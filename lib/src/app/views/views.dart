import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whose_house_2/src/app/app.dart';
import 'package:whose_house_2/src/services/authentication_service/authentication_service.dart';
import 'package:whose_house_2/src/ui/screens/screens.dart';
import 'package:whose_house_2/src/ui/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.authenticationService,
  }) : super(key: key);

  final AuthenticationService authenticationService;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationService,
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () => MaterialApp(
          theme: AppTheme.light(),
          home: BlocProvider(
            create: (context) =>
                AppBloc(authenticationService: authenticationService),
            child: AppView(),
          ),
        ),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      return FlowBuilder<AppStatus>(
        onGeneratePages: onGeneratePages,
        state: state.status,
      );
    });
  }

  List<Page> onGeneratePages(state, List<Page> pages) {
    return [
      if (state == AppStatus.authenticated) Home.page(),
      if (state == AppStatus.unauthenticated) Login.page(),
      if (state == AppStatus.initializing) Initialize.page(),
    ];
  }
}
