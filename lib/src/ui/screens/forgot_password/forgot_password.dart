import 'package:flutter/material.dart';
import 'package:whose_house_2/src/ui/widgets/widgets.dart';

import 'user_lookup_form.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthenticationPageTemplate(child: UserLookupForm());
  }
}
