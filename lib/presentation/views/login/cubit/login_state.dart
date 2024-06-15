part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginRefreshState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String msg;
  final Map<String,dynamic> data;

  LoginSuccessState(this.msg,this.data);
}
class LoginSuccessGoogleState extends LoginState {
  final String msg;
  final Map<String,dynamic> data;

  LoginSuccessGoogleState(this.msg,this.data);
}

class LoginErrorState extends LoginState {
  final String msg;

  LoginErrorState(this.msg);
}
