import 'dart:async';

import 'package:astha_agent/src/repository/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginClickEvent>(loginClickEvent);
  }

  FutureOr<void> loginClickEvent(
      LoginClickEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    print("Login Clicked");
    await AuthRepo()
        .login({"email": event.email, "password": event.password}).fold(
            (left) =>
                {
                  print("Login Error"),
                  emit(LoginErrorState(message: left.message))
                },
            (right) =>
                {print("Login Success"), emit(LoginSuccessState(body: right))});
  }
}
