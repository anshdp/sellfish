import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'customer_signup_event.dart';
part 'customer_signup_state.dart';

class CustomerSignupBloc extends Bloc<CustomerSignupEvent, CustomerSignupState> {
  CustomerSignupBloc() : super(CustomerSignupInitial()) {
    on<CustomerSignupEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
