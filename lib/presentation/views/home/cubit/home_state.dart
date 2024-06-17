part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeRefreshState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {

}
class HomeSuccessGoogleState extends HomeState {
  final String msg;
  final Map<String,dynamic> data;

  HomeSuccessGoogleState(this.msg,this.data);
}

class HomeErrorState extends HomeState {
  final String msg;

  HomeErrorState(this.msg);
}
