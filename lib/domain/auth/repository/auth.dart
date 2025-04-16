import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/auth/models/new_user_request.dart';
import 'package:ecommerce_app/data/auth/models/user_signin_request.dart';

abstract class AuthRepository
{
  Future<Either> signUp(NewUserRequest newUser);
  Future<Either> signIn(UserSignInRequest user);
  Future<Either> getAges();

}