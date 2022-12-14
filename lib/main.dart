import 'package:anime_rank/core/service_locator/service_locator.dart';
import 'package:anime_rank/firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:anime_rank/core/routes/app_router.dart';
import 'package:flutter/material.dart';

Future<void> initializeServices() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await ServiceLocator.setup();
  await GetIt.I.allReady();
}

Future<void> main() async {
  initializeServices();
  runApp(
    FutureBuilder(
      future: initializeServices(),
      builder: (_, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Container(),
          );
        }
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anime Rank',
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
