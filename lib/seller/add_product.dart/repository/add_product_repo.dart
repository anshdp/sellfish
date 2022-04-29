import 'dart:io';

import 'package:buy_fish/constants/db_collection_constants.dart';
import 'package:buy_fish/constants/db_field_constants.dart';
import 'package:buy_fish/helper/helper.dart';
import 'package:buy_fish/seller/add_product.dart/bloc/add_product_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

final CollectionReference products =
    FirebaseFirestore.instance.collection(productsCollection);
Uuid _randomId = const Uuid();

class AddProducts {
  Future<bool> addProduct(ProductDetails event) async {
    try {
      final reference = FirebaseStorage.instance
          .ref()
          .child('product_images')
          .child(event.productImage.name);

      final file = File(event.productImage.path);

      await reference.putFile(file);

      final imgPublicLink = await reference.getDownloadURL();

      await HelperClass().getValidationData();

      final productId = _randomId.v4();

      await products.add({
        nameField: event.productName,
        descriptionField: event.description,
        priceField: event.price,
        discountPriceField: event.discountPrice,
        quantityField: event.quantity,
        currentUser: userId,
        imageField: imgPublicLink,
        productIdField: productId
      });

      return true;
    } catch (e) {
      throw e;
    }
  }
}
