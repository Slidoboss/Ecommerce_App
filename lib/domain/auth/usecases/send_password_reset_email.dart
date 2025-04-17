import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/domain/auth/repository/auth.dart';
import 'package:ecommerce_app/service_locator.dart';

class SendPasswordResetEmailUsecase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await getIt<AuthRepository>().sendPasswordResetEmail(params!);
  }
}
