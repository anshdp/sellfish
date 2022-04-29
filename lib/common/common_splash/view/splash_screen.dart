import 'package:buy_fish/common/common_splash/bloc/splash_bloc.dart';
import 'package:buy_fish/router/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashBloc _splashBloc = SplashBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (context) => _splashBloc..add(NavigateEvent()),
      child: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is NavigateToLogin) {
            Navigator.pushReplacementNamed(context, RouteConstants.userLogin);
          } else if (state is NavigateToHome) {
            if (state.type == true) {
              Navigator.pushReplacementNamed(
                context,
                RouteConstants.sellerHomeRoute,
              );
            } else {
              Navigator.pushReplacementNamed(
                context,
                RouteConstants.customerHomeRoute,
              );
            }
          }
        },
        builder: (context, state) {
          return const Scaffold(
            body: Center(
              child: Text('SellFish'),
            ),
          );
        },
      ),
    );
  }
}
