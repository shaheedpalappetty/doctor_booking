part of 'login_bloc.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final Map body;

  LoginSuccessState({required this.body});
}

final class LoginErrorState extends LoginState {
  final String message;

  LoginErrorState({required this.message});
}
