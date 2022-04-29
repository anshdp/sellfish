part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailed extends LoginState {
  LoginFailed({this.message = ''});
  final String message;
}
