part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class UserLoginEvent extends LoginEvent {
  UserLoginEvent({required this.email, required this.password});
  final String email;
  final String password;
}

class CustomerLoginEvent extends LoginEvent {}
