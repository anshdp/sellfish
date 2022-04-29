import 'package:bloc/bloc.dart';
import 'package:buy_fish/helper/helper.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashEvent>(
      (event, emit) async {
        if (event is NavigateEvent) {
          await HelperClass().getValidationData();

          await Future<dynamic>.delayed(const Duration(seconds: 5));

          switch (isLogin) {
            case true:
              if (userType == true) {
                emit(NavigateToHome(type: userType));
              } else {
                emit(NavigateToHome(type: userType));
              }
              break;

            case false:
              emit(NavigateToLogin());
              break;

            default:
              emit(NavigateToLogin());
          }
        }
      },
    );
  }
}
