import 'package:bloc_test/user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final User user;
  static const routeName = "HOME";

  const HomePage({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Bem-Vindo: ${user.name}")),
    );
  }
}
