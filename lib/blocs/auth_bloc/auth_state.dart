import 'package:coding_task/models/user_model.dart';

class AuthFailure extends AuthState {
  final String error;

  AuthFailure(this.error);
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

abstract class AuthState {}

class AuthSuccess extends AuthState {
  final UserModel user;

  AuthSuccess(this.user);
}
