import 'package:ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce_app/presentation/auth/pages/forgot_password.dart';
import 'package:ecommerce_app/presentation/auth/pages/register.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _heading(context),
            SizedBox(height: 28),
            _emailInputField(context),
            SizedBox(height: 28),
            _passwordInputField(context),
            SizedBox(height: 20),
            _recoverPasswordButton(context),
            SizedBox(height: 28),
            _signInButton(context),
            SizedBox(height: 40),
            _createAccountButton(context),
          ],
        ),
      ),
    );
  }

  Widget _heading(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Text(
            'Hello Again!',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: const Color.fromARGB(255, 34, 34, 34)),
          ),
          SizedBox(height: 10),
          Text(
            'Fill your details or Continue with \n Social media',
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
          Text(
            'Email Address',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black),
          ),
          SizedBox(height: 10),
          TextField(
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

  Widget _passwordInputField(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black),
          ),
          SizedBox(height: 10),
          TextField(
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.visiblePassword,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black),
            decoration: InputDecoration(
                suffixIcon: Icon(Icons.remove_red_eye),
                hintText: '********',
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

  Widget _signInButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
      },
      title: 'Sign In',
    );
  }

  Widget _createAccountButton(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'New User? ',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black54),
          ),
          TextSpan(
            text: 'Create Account',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, RegisterPage());
              },
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
          ),
        ],
      ),
    );
  }

  Widget _recoverPasswordButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RichText(
          text: TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () {
              AppNavigator.push(context, ForgotPasswordPage());
            },
            text: 'Recover Password',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black54),
          ),
        ),
      ],
    );
  }
}
