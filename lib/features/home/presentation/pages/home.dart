import 'package:ecommerce/features/login_screen/domain/entities/login_entity.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  LoginEntity loginEntity;
  HomeScreen(this.loginEntity, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Hello ${loginEntity.user.name}"),
      ),
    );
  }
}
