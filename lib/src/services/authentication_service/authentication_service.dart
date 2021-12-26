import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:google_sign_in/google_sign_in.dart';

class User extends Equatable {
  final String id;
  final String? name;
  final String? phone;
  final String? photo;

  const User({
    required this.id,
    this.name,
    this.phone,
    this.photo,
  });

  static const empty = User(id: "");

  bool get isEmpty => this == empty;

  bool get isNotEmpty => this != empty;

  @override
  List<Object?> get props => [id, name, phone, photo];
}

/// simple cache service to store user data
class CacheClient {
  final Map<String, Object> _cache = {};
  CacheClient();

  void write(String key, Object value) {
    _cache[key] = value;
  }

  T? read<T extends Object>(String key) {
    final value = _cache[key];
    if (value is T) {
      return value;
    }
    return null;
  }
}

class AuthenticationService {
  final StreamController _userController;
  final CacheClient _cache;

  AuthenticationService({
    StreamController<User>? userController,
    CacheClient? cache,
    GoogleSignIn? googleSignIn,
  })  : _userController = userController ?? StreamController<User>(),
        _cache = cache ?? CacheClient();

  Stream<User> get user async* {
    yield User.empty;
    yield* _userController.stream.map((user) {
      _cache.write("user", user);
      return user;
    });
  }

  User get currentUser {
    return _cache.read<User>("user") ?? User.empty;
  }

  Future<void> logIntWithPhoneAndPassword(
    String phone,
    String password,
  ) async {
    // TODO: handle login from server
    await Future.delayed(const Duration(seconds: 1));
    _userController.add(
      User(
        id: "mock_user_id",
        phone: phone,
        name: "mock_name",
      ),
    );
  }

  Future<void> logOut() async {
    // TODO: handle logout from serverdfadf
    _userController.add(User.empty);
  }
}
