part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class RemoveWishlistItem extends WishlistEvent {
  RemoveWishlistItem({required this.productId});
  String productId;
}

class AddToCart extends WishlistEvent {
  AddToCart(this.productId);
  String productId;
}
