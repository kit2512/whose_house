import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whose_house_2/src/services/services.dart';
import 'package:whose_house_2/src/ui/screens/screens.dart';
import 'package:whose_house_2/src/ui/widgets/widgets.dart';

import 'login_form.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  static MaterialPage page() {
    return const MaterialPage(
      child: Login(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(context.read<AuthenticationService>()),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage!),
                ),
              );
          }
        },
        child: AuthenticationPageTemplate(
          child: LoginForm(),
        ),
      ),
    );
  }
}
