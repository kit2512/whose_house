import 'package:flutter/material.dart';
import 'package:whose_house_2/src/ui/widgets/widgets.dart';

import 'phone_number/phone_number_form.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  static MaterialPage page() {
    return MaterialPage(child: SignUp());
  }

  @override
  Widget build(BuildContext context) {
    return AuthenticationPageTemplate(
      child: PhoneNumberForm(),
    );
  }
}
