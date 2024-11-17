part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

final class SignInInitial extends SignInEvent {}

final class SignInButtonPressed extends SignInEvent {
  final String email;
  final String password;

  SignInButtonPressed({required this.email, required this.password});
}

final class SignInInputChanged extends SignInEvent {
  final String email;
  final String password;

  SignInInputChanged({required this.email, required this.password});
}

final class SignInPageSwitch extends SignInEvent {
  final String pageName;
  SignInPageSwitch({required this.pageName});
}
