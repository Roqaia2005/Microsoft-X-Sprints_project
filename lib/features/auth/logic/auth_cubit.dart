import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:souqak/features/auth/logic/firebase_service.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.service) : super(AuthInitial());

  final FirebaseService service;

  Future<void> signup(String email, String password) async {
    emit(AuthLoading());
    try {
      await service.signup(email, password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      await service.login(email, password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }
}
