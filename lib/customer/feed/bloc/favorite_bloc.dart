import 'package:bloc/bloc.dart';
import 'package:buy_fish/constants/db_collection_constants.dart';
import 'package:buy_fish/constants/db_field_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

final CollectionReference favoriteProducts =
    FirebaseFirestore.instance.collection(favoriteCollection);

final FirebaseAuth auth = FirebaseAuth.instance;

User? currentUser = auth.currentUser;

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<FavoriteEvent>((event, emit) async {
      if (event is AddToFavorite) {
        try {
          await favoriteProducts.doc(currentUser!.uid).update(
            {
              'favoriteProductsArray': FieldValue.arrayUnion(
                [
                  {
                    productIdField:
                        event.favoriteProducts[productIdField].toString(),
                    nameField: event.favoriteProducts[nameField].toString(),
                    imageField: event.favoriteProducts[imageField].toString(),
                    priceField: event.favoriteProducts[priceField].toString(),
                    discountPriceField:
                        event.favoriteProducts[discountPriceField].toString(),
                  }
                ].toList(),
              ),
            },
          );
        } catch (e) {
          print(e);
        }
      }
    });
  }
}
