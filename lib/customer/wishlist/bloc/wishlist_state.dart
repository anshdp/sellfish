part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class RemoveFromWishlist extends WishlistState {}

class AddedToCart extends WishlistState {}
