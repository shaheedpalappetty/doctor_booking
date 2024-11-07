part of 'login_bloc.dart';

abstract class LoginEvent {}

final class LoginClickEvent extends LoginEvent {
  final String email;
  final String password;

  LoginClickEvent({required this.email, required this.password});
}
