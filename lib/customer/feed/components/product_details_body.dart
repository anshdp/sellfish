import 'package:buy_fish/constants/db_field_constants.dart';
import 'package:buy_fish/customer/feed/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsBody extends StatelessWidget {
  DetailsBody({Key? key, required this.productData}) : super(key: key);

  dynamic productData;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: size.height * 0.3,
                  ),
                  padding: EdgeInsets.only(top: 30.w, left: 20.w),
                  // height: 500,
                  width: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Color'),
                      Row(
                        children: [
                          ColorDot(
                            color: Colors.deepPurple,
                            isSelected: true,
                          ),
                          ColorDot(
                            color: Colors.red,
                          ),
                          ColorDot(
                            color: Colors.orange,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Text(
                        '${productData[descriptionField].toString()} Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        style: GoogleFonts.poppins(fontSize: 15.sp),
                      ),
                    ],
                  ),
                ),
                ProductTitle(
                  productData: productData,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  ColorDot({
    Key? key,
    this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color? color;

  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.w, right: 5.w),
      padding: EdgeInsets.all(1.w),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected! ? color! : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
