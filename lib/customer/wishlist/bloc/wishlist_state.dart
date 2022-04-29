part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistRemovedSuccess extends WishlistState {}

class AddedToCart extends WishlistState {}
