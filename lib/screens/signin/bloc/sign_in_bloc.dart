import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInInputChanged>((event, emit) {
      if (EmailValidator.validate(event.email) == false) {
        emit(SignInErrorState(error: "Invalid email"));
      } else if (event.password.length < 6) {
        emit(SignInErrorState(error: "Password must be at least 6 characters"));
      } else {
        emit(SignInValidState());
      }
    });

    on<SignInButtonPressed>((event, emit) {
      emit(SignInLoadingState());
    });

    on<SignInPageSwitch>((event, emit) {
      emit(SignInPageSwitchState(event.pageName));
    });
  }
}
