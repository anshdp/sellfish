part of 'splash_bloc.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class NavigateToLogin extends SplashState {}

class NavigateToHome extends SplashState {
  NavigateToHome({this.type});
  bool? type;
}
