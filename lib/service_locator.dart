import 'package:ecommerce_app/data/auth/repository/auth_repository_implementation.dart';
import 'package:ecommerce_app/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce_app/domain/auth/repository/auth.dart';
import 'package:ecommerce_app/domain/auth/usecases/get_ages.dart';
import 'package:ecommerce_app/domain/auth/usecases/signup.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  //Services
  getIt.registerSingleton<AuthFirebaseService>(
      AuthFirebaseServiceImplementation());

  //Repository
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImplementation());

  //UseCase
  getIt.registerSingleton<SignupUsecase>(SignupUsecase());
  getIt.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
}
