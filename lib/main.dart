import 'package:flutter/material.dart';
import 'package:notes_app/screens/login_screen.dart';
import 'package:notes_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'model/provider/auth_provider.dart';
import 'model/provider/notes_provider.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => NotesProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Notes',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        // home: HomeScreen(),
        navigatorKey: navigationKey,
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
