import 'package:ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/data/auth/models/new_user_request.dart';
import 'package:ecommerce_app/presentation/auth/pages/gender_and_age.dart';
import 'package:ecommerce_app/presentation/auth/pages/signin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/button/basic_app_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //Added controllers, convertered to stateful class, added dispose method
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: SingleChildScrollView(
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
            controller: _nameController,
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
            controller: _passwordController,
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
        AppNavigator.push(
            context,
            GenderAndAgePage(
              newUserRequest: NewUserRequest(
                  name: _nameController.text,
                  email: _emailController.text,
                  password: _passwordController.text),
            )); //TODO fill with varibales.
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

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
