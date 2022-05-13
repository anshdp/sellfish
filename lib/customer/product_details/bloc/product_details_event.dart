part of 'product_details_bloc.dart';

@immutable
abstract class ProductDetailsEvent {}

class AddToCart extends ProductDetailsEvent {
  AddToCart({required this.cartProducts});
  dynamic cartProducts;
}
