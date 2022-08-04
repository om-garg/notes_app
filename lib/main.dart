import 'package:flutter/material.dart';
import 'package:notes_app/provider/auth_provider.dart';
import 'package:notes_app/provider/notes_provider.dart';
import 'package:notes_app/ui/screens/splash_screen.dart';
import 'package:provider/provider.dart';

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
