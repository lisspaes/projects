import 'package:flutter/material.dart';
import 'package:flutter_demostration/configuration/app_theme.dart';
import 'package:flutter_demostration/configuration/firebase_notifications.dart';
import 'package:flutter_demostration/configuration/router.dart';
import 'package:flutter_demostration/presentation/provider/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  FirebaseConf().initNotifications();
  runApp(const ProviderScope(child: MyApp()));
}



class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Se agrego ".router" para poder administrar las rutas 
    final AppTheme appTheme = ref.watch(themeNotifierProvider);
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: appTheme.getTheme(),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}

