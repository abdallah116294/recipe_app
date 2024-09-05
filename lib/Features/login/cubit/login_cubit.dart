import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/Features/login/data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepo}) : super(LoginInitial());
  final LoginRepo loginRepo;
  Future<void> createUser(
      {required String username, required String password}) async {
    emit(CreateUserLoading());
    try {
      await loginRepo.createUser(username: username, password: password);
      emit(CreateUserSuccess());
    } catch (e) {
      emit(CreateUserError());
    }
  }
    Future<void> loginUser(
      {required String username, required String password}) async {
    emit(LoginUserLoading());
    try {
      await loginRepo.loginUser(username: username, password: password);
      emit(LoginUserSuccess());
    } catch (e) {
      emit(LoginUserError());
    }
  }
}
