import 'package:covid_tracker/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  SharedPreferences pref = await SharedPreferences.getInstance();
  runApp(
    ChangeNotifierProvider(
      child: MyApp(),
      create: (context) => ThemeProvider(themeIndex: pref.getInt('savedTheme') ?? 0),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).getTheme,
      home: HomeScreen(), // Sementara Langsung ke HomeScreen dulu
    );
  }

  ThemeData buildThemeData() {
    return ThemeData();
  }
}
