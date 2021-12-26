import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whose_house_2/src/ui/theme/theme.dart';

class PhoneNumberForm extends StatelessWidget {
  const PhoneNumberForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Đăng ký tài khoản",
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.w800,
              ),
        ),
        SizedBox(
          height: 4.h,
        ),
        Text(
          "Nhập số điện thoại của bạn để đăng ký",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontWeight: FontWeight.w400,
                color: const Color(0xffa2a0a8),
              ),
        ),
        SizedBox(
          height: 40.h,
        ),
        _PhoneInput(),
        SizedBox(height: 18.h),
        _TermsOfUseAgreement(),
        SizedBox(
          height: 190.h,
        ),
        _OTPRequestButton(),
        SizedBox(
          height: 16.h,
        ),
        _Login()
      ],
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Bạn đã có tài khoản? ",
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: const Color(0xffa2a0a8),
            ),
        children: [
          TextSpan(
            text: "Đăng nhập",
            style: const TextStyle(
              color: AppTheme.kPrimaryColor,
              fontWeight: FontWeight.w800,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // TODO: Handle navigating to login page
              },
          ),
        ],
      ),
    );
  }
}

class _OTPRequestButton extends StatelessWidget {
  const _OTPRequestButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // TODO: implement submitting phone number
      },
      child: Text("Gửi mã OTP"),
    );
  }
}

class _TermsOfUseAgreement extends StatelessWidget {
  const _TermsOfUseAgreement({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.4,
          child: Checkbox(
              value: false,
              onChanged: (value) {
                //TODO: implement toggle terms of use agreement
              }),
        ),
        Text.rich(
          TextSpan(
            text: "Tôi đồng ý với ",
            style: Theme.of(context).textTheme.subtitle2,
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // TODO: handle showing terms of use agreement
                  },
                text: "Điều khoản sử dụng",
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff00bcd4),
                    ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _PhoneInput extends StatelessWidget {
  const _PhoneInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person), hintText: "Số điện thoại"),
    );
  }
}
