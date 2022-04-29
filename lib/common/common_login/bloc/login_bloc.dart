import 'package:bloc/bloc.dart';
import 'package:buy_fish/common/common_login/repository/common_login_repo.dart';

import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      try {
        if (event is UserLoginEvent) {
          await CommonLoginRepository().loginUser(event);
          emit(LoginSuccess());
        }
      } catch (e) {
        print(e);
      }
    });
  }
}
