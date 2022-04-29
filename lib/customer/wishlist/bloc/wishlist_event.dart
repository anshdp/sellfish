part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class RemoveFromWishlist extends WishlistEvent {
  RemoveFromWishlist(this.productId);
  String productId;
}

class AddToCart extends WishlistEvent {
  AddToCart(this.productId);
  String productId;
}
