import 'dart:io';

import 'package:buy_fish/seller/add_product.dart/bloc/add_product_bloc.dart';
import 'package:buy_fish/seller/add_product.dart/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

XFile? image;

class AddProducts extends StatefulWidget {
  const AddProducts({Key? key}) : super(key: key);

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  TextEditingController nameController = TextEditingController(text: ''),
      descriptionController = TextEditingController(text: '');

  TextEditingController priceController = TextEditingController(text: ''),
      discountPriceController = TextEditingController(text: ''),
      quantityController = TextEditingController(text: '');

  final AddProductBloc _addProduct = AddProductBloc();

  final TextStyle _textStyle = GoogleFonts.poppins(
    fontSize: 25.sp,
    color: Colors.grey,
    fontWeight: FontWeight.bold,
  );

  final ImagePicker _imagePicker = ImagePicker();

  Future<dynamic> getImage() async {
    try {
      image = await _imagePicker.pickImage(source: ImageSource.gallery);
    } catch (e) {
      return;
    }
  }

  void clearData() {
    nameController.clear();
    descriptionController.clear();
    priceController.clear();
    discountPriceController.clear();
    quantityController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _addProduct,
      child: BlocConsumer<AddProductBloc, AddProductState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 40.w),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.white,
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 7.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 0.9.sw,
                      height: .08.sh,
                      child: Center(
                        child: InkWell(
                          onTap: getImage,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Upload Image',
                                style: _textStyle,
                              ),
                              FaIcon(
                                FontAwesomeIcons.solidImage,
                                color: Colors.grey,
                                size: 25.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    CustomTextField(
                      hintText: 'ProductName',
                      controller: nameController,
                    ),
                    CustomTextField(
                      hintText: 'Description',
                      controller: descriptionController,
                    ),
                    CustomTextField(
                      hintText: 'Price',
                      controller: priceController,
                      inputType: TextInputType.number,
                    ),
                    CustomTextField(
                      hintText: 'Discount Price',
                      controller: discountPriceController,
                      inputType: TextInputType.number,
                    ),
                    CustomTextField(
                      hintText: 'Quantity',
                      controller: quantityController,
                      inputType: TextInputType.number,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _addProduct.add(
                          ProductDetails(
                            productName: nameController.text,
                            description: descriptionController.text,
                            price: double.parse(priceController.text),
                            discountPrice:
                                double.parse(discountPriceController.text),
                            quantity: int.parse(quantityController.text),
                            productImage: image!,
                          ),
                        );
                        clearData();
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 125,
                          ),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.greenAccent),
                      ),
                      child: Text(
                        'Add Product',
                        style: GoogleFonts.montserrat(
                          fontSize: 19,
                          color: Colors.white,
                          letterSpacing: 0.168,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
