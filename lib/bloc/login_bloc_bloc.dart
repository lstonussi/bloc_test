import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_test/user.dart';
import 'package:equatable/equatable.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBlocBloc() : super(LoginBlocInitial());

  @override
  Stream<LoginBlocState> mapEventToState(
    LoginBlocEvent event,
    //recebe todos os eventos que a aplicacao disparar e a partir disso
    //vai disparando os estados da aplicacao
  ) async* {
    if (event is SignInEvent) {
      try {
        yield StartLoginState();
        final user = await authenticate(event.email, event.pass);
        if (user == null) {
          yield ErrorLoginState(message: "E-mail ou senha incorreta");
        } else {
          yield SuccessLoginState(user: user);
        }
      } catch (e) {
        yield ErrorLoginState(message: "Ops! algo deu errado");
        print(e);
      }
    }
  }

  Future<User> authenticate(String email, String pass) {
    return Future.delayed(Duration(seconds: 3), () {
      if (email == "teste@teste.com.br" && pass == "123456")
        return User(email: email, name: "Lucas");
      return null;
    });
  }
}
