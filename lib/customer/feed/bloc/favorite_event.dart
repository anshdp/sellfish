part of 'favorite_bloc.dart';

abstract class FavoriteEvent {}

class AddToFavorite extends FavoriteEvent {
  AddToFavorite({this.favoriteProducts});
  dynamic favoriteProducts;
}
