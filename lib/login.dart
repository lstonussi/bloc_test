import 'package:bloc_test/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  final String errorMessage;
  Login({this.errorMessage});
  static const routeName = "LOGIN_PAGE";
  final _emailController = TextEditingController(text: "teste@teste.com.br");
  final _passController = TextEditingController(text: "1234561");

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LoginBloc>(context);
    void _authenticate() {
      bloc.add(SignInEvent(
          email: _emailController.text, pass: _passController.text));
    }

    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: _passController,
              ),
              SizedBox(
                height: 25,
              ),
              errorMessage == null ? SizedBox() : Text(errorMessage),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _authenticate();
                      },
                      child: Text("Login"),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
