import 'package:ecommerce/features/sign_up/domain/entities/SignUpEntity.dart';

import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    this.message,
    required super.user,
    required super.token,
  });

  LoginModel.fromJson(dynamic json)
      : this(
          message: json['message'],
          user: User.fromJson(json['user']),
          token: json['token'],
        );

  String? message;
}

class User extends UserEntity {
  User({
    required String name,
    required String email,
    this.role,
  }) : super(name: name, email: email);

  User.fromJson(dynamic json)
      : this(
          name: json['name'],
          email: json['email'],
          role: json['role'],
        );

  String? role;
}
