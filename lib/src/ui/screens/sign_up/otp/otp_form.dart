import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whose_house_2/src/ui/theme/theme.dart';

import 'otp_text_field.dart';

class OTPForm extends StatelessWidget {
  const OTPForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Xác thực mã OTP",
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.w800,
              ),
        ),
        SizedBox(
          height: 4.h,
        ),
        Text(
          "Mã xác thực đã được gửi đến số điện thoại",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.caption!.copyWith(
                color: const Color(0xffa2a0a8),
              ),
        ),
        SizedBox(
          height: 4.h,
        ),
        _OtpPhoneNumber(),
        SizedBox(
          height: 40.h,
        ),
        _OtpField(),
        SizedBox(
          height: 16.h,
        ),
        _OtpTime(),
        SizedBox(
          height: 156.h,
        ),
        _OtpResendButton(),
        SizedBox(
          height: 48.h,
        )
      ],
    );
  }
}

class _OtpResendButton extends StatelessWidget {
  const _OtpResendButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        //TODO: handle resend OTP
      },
      child: Text("Gửi lại mã OTP"),
    );
  }
}

class _OtpTime extends StatelessWidget {
  const _OtpTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Mã hết hiệu lực sau ",
        style: const TextStyle(color: Colors.black),
        children: [
          TextSpan(
            // TODO: Replace dummy OTP time
            text: "92 giây",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppTheme.kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _OtpField extends StatelessWidget {
  const _OtpField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 4,
      fillColor: const Color(0xfff2f2f2),
      filled: true,
      textStyle: TextStyle(
        color: Colors.black,
        fontSize: 28.sp,
        fontWeight: FontWeight.w800,
      ),
      size: 66.w,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      focusedBorderColor: AppTheme.kPrimaryColor,
    );
  }
}

class _OtpPhoneNumber extends StatelessWidget {
  const _OtpPhoneNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      // TODO: Replace dummy phone number
      "0987654321",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.subtitle2!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
    );
  }
}
