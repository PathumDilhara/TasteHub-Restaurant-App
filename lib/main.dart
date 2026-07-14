import 'package:flutter/material.dart';
import 'package:tastehub/core/router/router.dart';
import 'package:tastehub/core/utils/app_theme.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "TasteHub - Restaurant ordering mobile application",
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
    );
  }
}
