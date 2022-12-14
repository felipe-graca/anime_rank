import 'package:anime_rank/core/repository/auth/auth_repository_interface.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final IAuthRepository _authRepository;
  LoginCubit(this._authRepository) : super(const LoginState());
}
