import 'package:buy_fish/common/common_login/views/common_login_page.dart';
import 'package:buy_fish/common/waiting_screens/views/login_loading_page.dart';
import 'package:buy_fish/customer/home_bottom_navbar/customer_home.dart';
import 'package:buy_fish/router/app_constants.dart';
import 'package:buy_fish/seller/home/home.dart';
import 'package:buy_fish/seller/seller_signup/seller_signup.dart';
import 'package:flutter/material.dart';

String? finalType;

class AppRouter {
  Route onGenerateRoute(RouteSettings route) {
    switch (route.name) {
      case RouteConstants.userLogin:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => const CommonLogin(),
        );

      case RouteConstants.sellerSignUp:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => SellerSignUp(),
        );

      case RouteConstants.sellerHomeRoute:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => const SellerHomeScreen(),
        );

      case RouteConstants.loadingScreenRoute:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => LoadingScreen(),
        );

      case RouteConstants.customerHomeRoute:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => CustomerNavbar(),
        );

      default:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => const CommonLogin(),
        );
    }
  }
}
