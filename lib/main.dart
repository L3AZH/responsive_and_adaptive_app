import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_and_adaptive_app/ui/HomeScreen.dart';
import 'package:responsive_and_adaptive_app/viewmodel/HomeProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeProvider()),
        ],
      child: MaterialApp(
        initialRoute: '/home',
        routes: {
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
