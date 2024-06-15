part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpRefreshState extends SignUpState {}

class SignUpSuccessState extends SignUpState {
  final String msg;
  final Map<String, dynamic> data;

  SignUpSuccessState(this.msg, this.data);
}
class SignUpSuccessGoogleState extends SignUpState {
  final String msg;
  final Map<String, dynamic> data;

  SignUpSuccessGoogleState(this.msg, this.data);
}

//ignore: must_be_immutable
class SignUpErrorState extends SignUpState {
  String msg;

  SignUpErrorState(this.msg);
}
//ignore: must_be_immutable

class SignUpLoading extends SignUpState {}
