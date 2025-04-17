import 'package:ecommerce_app/core/config/app_config.dart';
import 'package:ecommerce_app/data/auth/repository/auth_repository_implementation.dart';
import 'package:ecommerce_app/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce_app/domain/auth/repository/auth.dart';
import 'package:ecommerce_app/domain/auth/usecases/get_ages.dart';
import 'package:ecommerce_app/domain/auth/usecases/signin.dart';
import 'package:ecommerce_app/domain/auth/usecases/signup.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  //Configs
  getIt.registerSingleton<AppConfig>(AppConfig(
      apikeyAndroid: dotenv.env['FIREBASE_API_KEY_ANDROID']!,
      apikeyIos: dotenv.env['FIREBASE_API_KEY_IOS']!,
      androidAppId: dotenv.env['ANDROID_APP_ID']!,
      iosAppID: dotenv.env['IOS_APP_ID']!,
      messagingSenderId: dotenv.env['MESSAGING_SENDER_ID']!,
      projectId: dotenv.env['PROJECT_ID']!,
      storageBucket: dotenv.env['STORAGE_BUCKET']!,
      iosBundleId: dotenv.env['IOS_BUNDLE_ID']!));

  //Services
  getIt.registerSingleton<AuthFirebaseService>(
      AuthFirebaseServiceImplementation());

  //Repository
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImplementation());

  //UseCase
  getIt.registerSingleton<SignupUsecase>(SignupUsecase());
  getIt.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
  getIt.registerSingleton<SignInUsecase>(SignInUsecase());
}
