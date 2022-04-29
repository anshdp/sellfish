part of 'seller_login_bloc.dart';

@immutable
abstract class SellerSignUpState {}

class SellerLoginInitial extends SellerSignUpState {}

class NavigateToLogin extends SellerSignUpState {}

class SignUpFailedState extends SellerSignUpState {
  SignUpFailedState({this.message = ''});
  String message;
}
