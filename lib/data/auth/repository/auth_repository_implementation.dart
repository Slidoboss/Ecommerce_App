import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/auth/models/new_user_request.dart';
import 'package:ecommerce_app/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce_app/domain/auth/repository/auth.dart';
import 'package:ecommerce_app/service_locator.dart';

class AuthRepositoryImplementation extends AuthRepository {
  @override
  Future<Either> signUp(NewUserRequest newUser) async {
    return await getIt<AuthFirebaseService>().signUp(newUser);
  }

  @override
  Future<Either> getAges() async {
    return await getIt<AuthFirebaseService>().getAges();
  }
}
