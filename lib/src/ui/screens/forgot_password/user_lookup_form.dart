import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserLookupForm extends StatelessWidget {
  const UserLookupForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Tìm lại mật khẩu",
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.w800,
              ),
        ),
        SizedBox(height: 4.h),
        Text("Nhập tên tài khoản hoặc số điện thoại để tìm lại mật khẩu",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: const Color(0xffa0a2a8),
                )),
        SizedBox(height: 40.h),
        _UsernameOrPhone(),
        SizedBox(height: 40.h),
        ElevatedButton(
          onPressed: () {
            // TODO: handle sending password reset request
          },
          child: const Text("Gửi yêu cầu"),
        ),
        SizedBox(height: 216.h),
      ],
    );
  }
}

class _UsernameOrPhone extends StatelessWidget {
  const _UsernameOrPhone({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Tên tài khoản số điện thoại",
        prefixIcon: Icon(Icons.person),
      ),
    );
  }
}
