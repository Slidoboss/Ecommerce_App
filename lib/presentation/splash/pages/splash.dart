import 'package:ecommerce_app/core/config/assets/app_vectors.dart';
import 'package:ecommerce_app/presentation/auth/pages/signin.dart';
import 'package:ecommerce_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:ecommerce_app/presentation/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit,SplashState>(
      listener: (context, state) {
        if (state is UnAuthenicated) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const SignInPage()),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Center(
          child: SvgPicture.asset(AppVectors.appLogo),
        ),
      ),
    );
  }
}
