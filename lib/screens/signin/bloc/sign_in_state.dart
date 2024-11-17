part of 'sign_in_bloc.dart';

@immutable
sealed class SignInState {}

final class SignInInitialState extends SignInState {}

class SignInValidState extends SignInState {}

class SignInErrorState extends SignInState {
  final String error;

  SignInErrorState({required this.error});
}

class SignInLoadingState extends SignInState {}

class SignInPageSwitchState extends SignInState {
  final String pageName;

  SignInPageSwitchState(this.pageName);
}
