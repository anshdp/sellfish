part of 'seller_login_bloc.dart';

@immutable
abstract class SellerSignUpEvent {}

class SignUpSeller extends SellerSignUpEvent {
  SignUpSeller({
    required this.email,
    required this.password,
    required this.phoneNo,
    required this.username,
  });

  String email;
  String password;
  String username;
  String phoneNo;
}

class NewEvent extends SellerSignUpEvent {}
