import 'package:bloc/bloc.dart';
import 'package:buy_fish/constants/db_collection_constants.dart';
import 'package:buy_fish/constants/db_field_constants.dart';
import 'package:buy_fish/helper/helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

var _favcollection = FirebaseFirestore.instance.collection(favoriteCollection);

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistEvent>((event, emit) {
      if (event is RemoveFromWishlist) {
        print(event.productId);
        HelperClass().getValidationData();
        _favcollection.doc(userId).update({});
      }
    });
  }
}
