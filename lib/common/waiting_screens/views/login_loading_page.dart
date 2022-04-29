import 'package:buy_fish/common/common.dart';
import 'package:buy_fish/router/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  LoadingScreen({Key? key}) : super(key: key);
  final LoaderBloc _loaderBloc = LoaderBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loaderBloc..add(CheckUserEvent()),
      child: BlocConsumer<LoaderBloc, LoaderState>(
        listener: (context, state) {
          if (state is NavigateToSeller) {
            Navigator.pushReplacementNamed(
              context,
              RouteConstants.sellerHomeRoute,
            );
          } else if (state is NavigateToCustomer) {
            Navigator.pushReplacementNamed(
              context,
              RouteConstants.customerHomeRoute,
            );
          } else {
            Navigator.pushReplacementNamed(
              context,
              RouteConstants.userLogin,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Lottie.asset('static/animations/the-walking-fish.json'),
            ),
          );
        },
      ),
    );
  }
}
