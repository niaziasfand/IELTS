import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ilet/view/screens/favorite/favoriteProvider.dart';
import 'package:provider/provider.dart';
import 'config/routes/routes.dart';
import 'config/theme/light_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => FavoriteProvider()),
  ], child: MyApp()));
}

//DO NOT REMOVE Unless you find their usage.
String dummyImg =
    'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Bee Keep',
      theme: LightTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppLinks.Loading,
      getPages: AppRoutes.pages,
      defaultTransition: Transition.fadeIn,
    );
  }
}
