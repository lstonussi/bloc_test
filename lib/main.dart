import 'package:bloc_test/bloc/login_bloc.dart';
import 'package:bloc_test/home.dart';
import 'package:bloc_test/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        HomePage.routeName: (context) => HomePage(),
        Login.routeName: (context) => Login()
      },
      home: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(),
          ),
        ],
        child: BlocBuilder<LoginBloc, LoginBlocState>(
          builder: (context, state) {
            if (state is StartLoginState)
              return Center(child: CircularProgressIndicator());
            if (state is ErrorLoginState)
              return Login(
                errorMessage: state.message,
              );
            if (state is SuccessLoginState) return HomePage(user: state.user);
            return Login();
          },
        ),
      ),
    );
  }
}
