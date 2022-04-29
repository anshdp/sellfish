// ignore_for_file: avoid_dynamic_calls

import 'package:buy_fish/common/common.dart';
import 'package:buy_fish/common/common_login/bloc/login_bloc.dart';
import 'package:buy_fish/router/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonLogin extends StatefulWidget {
  const CommonLogin({Key? key}) : super(key: key);

  @override
  State<CommonLogin> createState() => _CommonLoginState();
}

class _CommonLoginState extends State<CommonLogin> {
  final TextEditingController _passwordController =
          TextEditingController(text: ''),
      _emailController = TextEditingController(text: '');

  final LoginBloc _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginBloc,
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushNamed(context, RouteConstants.loadingScreenRoute);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 200, horizontal: 30),
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'SellFish',
                              style: GoogleFonts.poppins(
                                fontSize: 40,
                                color: const Color(0xff205072),
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Enter your login details',
                              style: GoogleFonts.montserrat(
                                fontSize: 25,
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const SizedBox(height: 20),
                        CustomLoginField(
                          controller: _emailController,
                          hintText: 'Email',
                          secured: false,
                          isEmail: true,
                        ),
                        const SizedBox(height: 5),

                        CustomLoginField(
                          controller: _passwordController,
                          hintText: 'Password',
                          secured: true,
                          isEmail: false,
                        ),
                        const SizedBox(height: 5),

                        // Text(
                        //   _errorMessage!,
                        //   style: GoogleFonts.montserrat(
                        //     fontSize: 18,
                        //     color: Colors.red,
                        //     fontWeight: FontWeight.w500,
                        //   ),
                        // ),
                        const SizedBox(
                          height: 5,
                        ),
                        LinkButton(
                          subText: 'Forgot Password',
                          linkText: '',
                          onTap: () {},
                        ),
                        const SizedBox(height: 10),

                        ElevatedButton(
                          onPressed: () {
                            _loginBloc.add(
                              UserLoginEvent(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            );
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                vertical: 18,
                                horizontal: 140,
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
                            'Log In',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: Colors.white,
                              letterSpacing: 0.168,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        LinkButton(
                          subText: 'New to SellFish',
                          linkText: 'Sign Up',
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteConstants.customerSignUp,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LinkButton(
                          subText: 'Create a',
                          linkText: 'Seller Account',
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteConstants.sellerSignUp,
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
