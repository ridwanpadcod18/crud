import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.dark,
      theme: ThemeData(
          primaryColor: Colors.black,
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
          appBarTheme:
              AppBarTheme(backgroundColor: Colors.transparent, elevation: 0)),
      title: 'Data Mahasiswa',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
      },
    );
  }
}
