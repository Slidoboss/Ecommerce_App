import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/data/auth/models/user_signin_request.dart';
import 'package:ecommerce_app/domain/auth/repository/auth.dart';
import 'package:ecommerce_app/service_locator.dart';

class SignInUsecase extends UseCase<Either, UserSignInRequest> {
  @override
  Future<Either> call({UserSignInRequest? params}) async {
    return await getIt<AuthRepository>().signIn(params!);
  }
}
