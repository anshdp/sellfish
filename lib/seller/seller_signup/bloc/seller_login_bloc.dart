import 'package:bloc/bloc.dart';
import 'package:buy_fish/seller/seller_signup/repository/sign_up_repo.dart';
import 'package:meta/meta.dart';

part 'seller_login_event.dart';
part 'seller_login_state.dart';

class SellerSignUpBloc extends Bloc<SellerSignUpEvent, SellerSignUpState> {
  SellerSignUpBloc() : super(SellerLoginInitial()) {
    on<SellerSignUpEvent>((event, emit) async {
      if (event is SignUpSeller) {
        try {
          await SignUpRepo().createUser(event);
          emit(NavigateToLogin());
        } catch (e) {
          print(e);
          emit(
            SignUpFailedState(
              message: e.toString(),
            ),
          );
        }
      }
    });
  }
}
