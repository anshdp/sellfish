import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:buy_fish/seller/add_product.dart/repository/add_product_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductBloc() : super(AddProductInitial()) {
    on<AddProductEvent>((event, emit) async {
      if (event is ProductDetails) {
        try {
          await AddProducts().addProduct(event);
        } catch (e) {
          print(e);
        }
      }
    });
  }
}
