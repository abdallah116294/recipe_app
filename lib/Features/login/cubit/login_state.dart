part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}
class CreateUserLoading extends LoginState{}
class CreateUserSuccess extends LoginState{}
class CreateUserError extends LoginState{} 
class LoginUserLoading extends LoginState{}
class LoginUserSuccess extends LoginState{}
class LoginUserError extends LoginState{}