import 'package:ecommerce_app/common/bloc/button/button_state.dart';
import 'package:ecommerce_app/common/bloc/button/button_state_cubit.dart';
import 'package:ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/common/widgets/button/basic_reactive_button.dart';
import 'package:ecommerce_app/domain/auth/usecases/send_password_reset_email.dart';
import 'package:ecommerce_app/presentation/auth/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: BlocProvider(
          create: (context) => ButtonStateCubit(),
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonFailureState) {
                var snackBar = SnackBar(
                  content: Text(state.errorMessage),
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              if (state is ButtonSuccessState) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        icon: Icon(
                          Icons.forward_to_inbox_sharp,
                          size: 24.0,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        title: Text(
                          'Check your email',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: const Color.fromARGB(255, 34, 34, 34)),
                        ),
                        content: Text(
                          'We have sent password recover code to your email',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.black54),
                        ),
                        actions: [
                          Center(
                            child: FilledButton(
                              onPressed: () =>
                                  AppNavigator.pushReplacement(context, SignInPage()),
                              style: FilledButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary),
                              child: Text('Return to Login',style: Theme.of(context).textTheme.bodyLarge),
                            ),
                          )
                        ],
                      );
                    });
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _heading(context),
                SizedBox(height: 28),
                _emailInputField(context),
                SizedBox(height: 28),
                _resetButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _heading(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Text(
            'Forgot Password',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: const Color.fromARGB(255, 34, 34, 34)),
          ),
          SizedBox(height: 10),
          Text(
            'Enter Your Email Address to Reset \n Your Password',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _emailInputField(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _emailController,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.emailAddress,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black),
            decoration: InputDecoration(
                hintText: 'xyz@email.com',
                filled: true,
                fillColor: const Color.fromARGB(255, 227, 227, 227),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(16),
                )),
          ),
        ],
      ),
    );
  }

  Widget _resetButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicReactiveButton(
        onPressed: () {
          String email = _emailController.text;
          context
              .read<ButtonStateCubit>()
              .execute(email, SendPasswordResetEmailUsecase());
        },
        title: 'Reset Password',
      );
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
