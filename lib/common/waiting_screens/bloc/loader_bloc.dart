import 'package:bloc/bloc.dart';
import 'package:buy_fish/constants/sharedpreferences_constants.dart';
import 'package:buy_fish/helper/helper.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'loader_event.dart';
part 'loader_state.dart';

class LoaderBloc extends Bloc<LoaderEvent, LoaderState> {
  LoaderBloc() : super(LoaderInitial()) {
    on<LoaderEvent>((event, emit) async {
      if (event is CheckUserEvent) {
        await HelperClass().getValidationData();
        await Future<dynamic>.delayed(const Duration(seconds: 2));
        final preference = await SharedPreferences.getInstance();

        switch (userType) {
          case true:
            if (permissionType == true) {
              emit(NavigateToSeller());
              await preference.setBool(isLoginPref, true);
            } else {
              emit(NavigationFailed());
            }
            break;
          case false:
            emit(NavigateToCustomer());
            await preference.setBool(isLoginPref, true);

            break;
          default:
            emit(NavigationFailed());
        }
      }
    });
  }
}
