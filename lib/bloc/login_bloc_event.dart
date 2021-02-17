part of 'login_bloc_bloc.dart';

abstract class LoginBlocEvent extends Equatable {
  const LoginBlocEvent();
}

class SignInEvent extends LoginBlocEvent {
  final String email;
  final String pass;

  SignInEvent({this.pass, this.email});

  @override
  List<Object> get props => [email, pass];
}
