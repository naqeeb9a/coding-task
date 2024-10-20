abstract class AuthEvent {}

class RegisterUserEvent extends AuthEvent {
  final String email;
  final String password;

  RegisterUserEvent(this.email, this.password);
}
