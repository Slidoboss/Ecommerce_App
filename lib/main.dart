import 'package:ecommerce_app/core/config/size_config.dart';
import 'package:ecommerce_app/core/theme/app_theme.dart';
import 'package:ecommerce_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:ecommerce_app/presentation/splash/pages/splash.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'lib/core/config/firebase.env');
  await initializeDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocProvider(
      create: (context) => SplashCubit()
        ..appStarted(), // ".." this is called a cascade operator it allows an instance of a class to be created and executed immediately.
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: true,
        theme: AppTheme.themeData,
        darkTheme: AppTheme.darkThemeData,
        themeMode: ThemeMode.system,
        home: const SplashPage(),
      ),
    );
  }
}
