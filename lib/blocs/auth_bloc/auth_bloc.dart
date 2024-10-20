import 'package:coding_task/blocs/auth_bloc/auth_event.dart';
import 'package:coding_task/blocs/auth_bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repos/auth_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc(this._authService) : super(AuthInitial()) {
    on<RegisterUserEvent>(_onRegisterUser);
  }

  Future<void> _onRegisterUser(RegisterUserEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authService.registerUser(event.email, event.password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
