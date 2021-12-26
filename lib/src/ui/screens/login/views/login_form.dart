import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:whose_house_2/src/ui/theme/theme.dart';

import '../../screens.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _PhoneInput(),
        SizedBox(height: 24.h),
        _PasswordInput(),
        SizedBox(height: 24.h),
        _ForgetPasswordText(),
        SizedBox(height: 24.h),
        _LoginButton(),
        SizedBox(height: 16.h),
        _SignUpText(),
        SizedBox(height: 56.h),
        _SocialAuthButtons(),
      ],
    );
  }
}

class _SocialAuthButtons extends StatelessWidget {
  const _SocialAuthButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(
              color: Color(0xffE5E5E5),
              thickness: 1.h,
            ),
            Text(
              "hoặc đăng nhập bằng",
              style: TextStyle(
                color: Color(0xffa2a0a8),
              ),
            ),
            Divider(
              color: Color(0xffE5E5E5),
              thickness: 1.h,
            ),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/facebook_logo.png",
              width: 32.w,
            ),
            SizedBox(width: 40.w),
            Image.asset(
              "assets/images/google_logo.png",
              width: 32.w,
            ),
          ],
        )
      ],
    );
  }
}

class _SignUpText extends StatelessWidget {
  const _SignUpText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Bạn chưa có tài khoản?",
        style: const TextStyle(
          color: Color(0xffA2A0A8),
        ),
        children: [
          TextSpan(
            text: " Đăng ký",
            style: TextStyle(
              color: AppTheme.kPrimaryColor,
              fontWeight: FontWeight.w700,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return SignUp();
                }));
              },
          ),
        ],
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state.status == FormzStatus.submissionInProgress) {
          return const CircularProgressIndicator();
        }
        return ElevatedButton(
          onPressed: state.status == FormzStatus.invalid
              ? null
              : context.read<LoginCubit>().loginWithPhoneAndPassword,
          child: const Text("Đăng nhập"),
        );
      },
    );
  }
}

class _ForgetPasswordText extends StatelessWidget {
  const _ForgetPasswordText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ForgotPassword();
          }));
        },
        child: Text("Quên mật khẩu?"),
      ),
    );
  }
}

class _PasswordInput extends StatefulWidget {
  const _PasswordInput({
    Key? key,
  }) : super(key: key);

  @override
  State<_PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<_PasswordInput> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextField(
          key: const Key("loginForm_passwordInput"),
          obscureText: _obscureText,
          onChanged: context.read<LoginCubit>().passwordChanged,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock),
            hintText: "Mật khẩu",
            errorText: state.password.invalid ? "Mật khẩu không hợp lệ" : null,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              icon:
                  Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
            ),
          ),
        );
      },
    );
  }
}

class _PhoneInput extends StatelessWidget {
  const _PhoneInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextField(
          key: const Key("loginForm_phoneInput"),
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.person),
            hintText: "Số điện thoại",
            errorText:
                state.phone.invalid ? "Số điện thoại không hợp lệ" : null,
          ),
          onChanged: context.read<LoginCubit>().phoneChanged,
        );
      },
    );
  }
}
