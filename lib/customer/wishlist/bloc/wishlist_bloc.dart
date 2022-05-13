import 'package:bloc/bloc.dart';
import 'package:buy_fish/constants/db_collection_constants.dart';
import 'package:buy_fish/helper/helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistEvent>((event, emit) {
      if (event is RemoveWishlistItem) {
        deleteItem(event.productId);
      }
    });
  }
}

Future deleteItem(String _productId) async {
  final pricing = <dynamic>[];

  await HelperClass().getValidationData();

  final _favCollection =
      FirebaseFirestore.instance.collection(favoriteCollection).doc(userId);

  final docSnap = await _favCollection.get();

  final queue = docSnap.get('favoriteProductsArray') as List;

  for (final item in queue) {
    if (item['productId'].contains(_productId) == true) {
      pricing.add(item);
    }
  }

  await _favCollection.update(
    {
      'favoriteProductsArray': FieldValue.arrayRemove(pricing),
    },
  );
}
