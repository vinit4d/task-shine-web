import 'package:demo/presentation/views/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/views/home/home.dart';
import '../presentation/views/login/cubit/login_cubit.dart';
import '../presentation/views/login/login_view.dart';
import '../presentation/views/signUp/cubit/sign_up_cubit.dart';
import '../presentation/views/signUp/signup_view.dart';
import 'extensions/page_navigation.dart';

class AppRoute {
  static const String homeRoute = "/HomePage";
  static const String loginRoute = "/LoginPage";
  static const String signUpRoute = "/SignupPage";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return PageNavigation.push(
            isLTR: true,
            child: BlocProvider(
                create: (context) => LoginCubit(), child: LoginScreen()));

      case signUpRoute:
        return PageNavigation.push(
            isLTR: true,
            child: BlocProvider(
              create: (context) => SignUpCubit(),
              child: SignUpScreen(),
            ));

      case homeRoute:
        Map<String, dynamic> data = settings.arguments as Map<String, dynamic>;
        return PageNavigation.push(
          isLTR: true,
          child:
          BlocProvider(
            create: (context) => HomeCubit(),
            child: Home(name: data['name'], email: data['email']),
          ),



        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
