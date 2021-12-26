import 'package:flutter/material.dart';
import 'package:whose_house_2/src/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static MaterialPage page() {
    return MaterialPage(child: Home());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.read<AuthenticationService>().currentUser.id,
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: context.read<AuthenticationService>().logOut,
              child: Text("Log out"),
            ),
          ],
        ),
      ),
    );
  }
}
