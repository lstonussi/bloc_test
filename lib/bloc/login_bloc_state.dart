part of 'login_bloc_bloc.dart';

abstract class LoginBlocState extends Equatable {
  const LoginBlocState();
}

class LoginBlocInitial extends LoginBlocState {
  @override
  List<Object> get props => [];
}

class StartLoginState extends LoginBlocState {
  @override
  List<Object> get props => null;
}

class SuccessLoginState extends LoginBlocState {
  final User user;
  SuccessLoginState({this.user});
  @override
  List<Object> get props => [user];
}

class ErrorLoginState extends LoginBlocState {
  final String message;
  ErrorLoginState({
    this.message,
  });

  @override
  List<Object> get props => [message];
}
