import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/data/auth/models/new_user_request.dart';
import 'package:ecommerce_app/domain/auth/repository/auth.dart';
import 'package:ecommerce_app/service_locator.dart';

class SignupUsecase implements UseCase<Either, NewUserRequest> {
  @override
  Future<Either> call({NewUserRequest? params}) async {
    return await getIt<AuthRepository>().signUp(params!);
  }
}
