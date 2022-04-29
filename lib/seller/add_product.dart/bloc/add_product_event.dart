part of 'add_product_bloc.dart';

@immutable
abstract class AddProductEvent {}

class ProductDetails extends AddProductEvent {
  ProductDetails({
    required this.productImage,
    required this.productName,
    required this.description,
    required this.price,
    required this.discountPrice,
    required this.quantity,
  });
  final String productName, description;
  XFile productImage;
  final num price, discountPrice, quantity;
}
