import 'package:ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/data/auth/models/new_user_request.dart';
import 'package:ecommerce_app/presentation/auth/pages/gender_and_age.dart';
import 'package:ecommerce_app/presentation/auth/pages/signin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/button/basic_app_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
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
            _nameInputField(context),
            SizedBox(height: 28),
            _emailInputField(context),
            SizedBox(height: 28),
            _passwordInputField(context),
            SizedBox(height: 28),
            _continueButton(context),
            SizedBox(height: 40),
            _signInToAccountButton(context),
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
            'Register Account',
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

  Widget _nameInputField(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Name',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black),
          ),
          SizedBox(height: 10),
          TextField(
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.name,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black),
            decoration: InputDecoration(
                hintText: 'xxxxxxxxxxx',
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

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(context, GenderAndAgePage(newUserRequest: NewUserRequest(name: '', email: '', password:''),)); //TODO fill with varibales.
      },
      title: 'Continue',
    );
  }

  Widget _signInToAccountButton(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account? ',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black54),
          ),
          TextSpan(
            text: 'Log In',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.pushReplacement(context, SignInPage());
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
}
