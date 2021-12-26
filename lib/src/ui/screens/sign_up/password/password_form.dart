import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordForm extends StatelessWidget {
  const PasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Tạo mật khẩu",
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.w800,
              ),
        ),
        SizedBox(height: 4.h),
        Text(
          "Mật khẩu phải có ít nhất 8 ký tự, có chữ hoa và chữ thường",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: const Color(0xffa2a0a8),
          ),
        ),
        SizedBox(height: 40.h),
        _SignUpPassWord(),
        SizedBox(height: 24.h),
        _SignUpConfirmPassword(),
        SizedBox(height: 128.h),
        ElevatedButton(
          onPressed: () {},
          child: Text("Tạo mật khẩu"),
        ),
      ],
    );
  }
}

class _SignUpConfirmPassword extends StatelessWidget {
  const _SignUpConfirmPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Xác nhận mật khẩu",
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(Icons.visibility_off),
          onPressed: () {
            // TODO: handle signup cofirm password visibility,
          },
        ),
      ),
    );
  }
}

class _SignUpPassWord extends StatelessWidget {
  const _SignUpPassWord({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Mật khẩu",
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(Icons.visibility_off),
          onPressed: () {
            // TODO: handle signup password visibility,
          },
        ),
      ),
    );
  }
}
